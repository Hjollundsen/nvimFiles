return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'palenight'
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename', 'filesize'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'lsp_status'},
        lualine_z = {'location'}
      }
    })
  end
}
