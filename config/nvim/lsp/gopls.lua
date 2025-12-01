return {
    settings = {
        gopls = {
            semanticTokens = true,
            usePlaceholders = true,
            analyses = {
                composites = false,
                ST1021 = false,
                ST1003 = false,
                ST1012 = false,
                ST1020 = false,
                ST1000 = false,
            },
            staticcheck = true,
            hints = {
                assignVariableTypes = true,
                rangeVariableTypes = true,
            },
        }
    }
}
