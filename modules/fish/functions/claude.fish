    if test "$CLAUDE_WRAPPER_DISABLE" = "1"
        command claude $argv
        return $status
    end

    if string match -q '*product=*' -- "$OTEL_RESOURCE_ATTRIBUTES"
        command claude $argv
        return $status
    end

    set -q CLAUDE_PRODUCT_RESOLVER
    or set -l CLAUDE_PRODUCT_RESOLVER "/Library/Application Support/ClaudeCode/hooks/set_product_attribution.py"

    if not test -f "$CLAUDE_PRODUCT_RESOLVER"; or not command -v python3 >/dev/null 2>&1
        command claude $argv
        return $status
    end

    set -l _product (python3 "$CLAUDE_PRODUCT_RESOLVER" --print-product "$PWD" 2>/dev/null)

    if test -z "$_product"; or string match -q '*[^a-z0-9._-]*' -- "$_product"
        command claude $argv
        return $status
    end

    if test -n "$OTEL_RESOURCE_ATTRIBUTES"
        set -x OTEL_RESOURCE_ATTRIBUTES "$OTEL_RESOURCE_ATTRIBUTES,product=$_product"
    else
        set -x OTEL_RESOURCE_ATTRIBUTES "product=$_product"
    end

    if test "$CLAUDE_WRAPPER_VERBOSE" = "1"
        printf 'claude-env: product=%s\n' "$_product" >&2
    end

    command claude $argv

    # Clean up so we don't leak product= into the shell after claude exits
    set -e OTEL_RESOURCE_ATTRIBUTES
