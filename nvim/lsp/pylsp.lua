return {
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                },
                jedi_completions = {
                    enabled = true,
                    include_params = true,
                },
                pycodestyle = {
                    enabled = false
                },
                pyflakes = {
                    enabled = false,
                },
                autopep8 = {
                    enabled = false,
                },
                yapf = {
                    enabled = false,
                },
            }
        }
    }
}
