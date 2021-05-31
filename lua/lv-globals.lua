CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

O = {
    python = {
        linter = 'black',
        -- @usage can be 'yapf', 'black'
        formatter = 'black',
        autoformat = false,
        isort = true,
        diagnostics = {virtual_text = true, signs = false, underline = true},
		analysis = {type_checking = "off", auto_search_paths = true, use_library_code_types = true}
    },
    dart = {sdk_path = '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot'},
    lua = {
        -- @usage can be 'lua-format'
        formatter = 'lua-format',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = false, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = 'shellcheck',
        -- @usage can be 'shfmt'
        formatter = 'shfmt',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = false, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = '',
        -- @usage can be 'prettier'
        formatter = 'prettier',
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = false, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = 'prettier',
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = false, underline = true}
    },
    tailwindls = {filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}},
    clang = {diagnostics = {virtual_text = false, signs = false, underline = false}},
	ruby = {
        autoformat = true,
		diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = false, underline = true},
		filetypes = {'rb', 'erb', 'rakefile'}
	},
	go = {
		autoformat = true,
	},
	csharp = {
		autoformat = true,
	}
}
