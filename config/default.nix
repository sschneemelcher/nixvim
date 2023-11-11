{self, ...}: {
# Import all your configuration modules here
imports = [];
config = {
colorschemes.onedark = {
    enable = true;
};

options = {
      termguicolors = true;
      number = true;
	  rnu = true;
      tabstop = 4;
      shiftwidth = 4;
      scrolloff = 6;
      signcolumn = "yes";
      colorcolumn = "80";
      timeout = true;
      timeoutlen = 300;
	  
    };

plugins = {
    # core functionality
    bufferline.enable = true;
    treesitter.enable = true;
    treesitter-context.enable = true;
    lightline.enable = true;
    undotree.enable = true;
	luasnip.enable = true;
	nvim-cmp = {
      enable = true;

      snippet.expand = "luasnip";

      mapping = {
        "<CR>" = "cmp.mapping.confirm({select = true })";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<Tab>" = ''
          cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" })
        '';
        "<S-Tab>" = ''
          cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" })
        '';
        "<Down>" = "cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'})";
        "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'})";
      };

      sources = [
        {name = "luasnip";}
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
      ];
    };

    lsp = {
      enable = true;

      enabledServers = [];

      keymaps = {
        silent = true;

        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "ca" = "code_action";
          "ff" = "format";
          "K" = "hover";
        };
      };

      servers = {
          pyright.enable = true;
      };
    };


    telescope = {
    	enable = true;
        keymaps = {
            "<C-p>" = {
                action = "find_files";
                desc = "Telescope Git Files";
            };
            "<leader>fg" = "live_grep";
        };
    };

    startify.enable = true;
};
};
}
