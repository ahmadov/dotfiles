local utils = require('utils')

-- keybind list
utils.map("", "<leader>c", '"+y')

-- open terminals 
-- utils.map('n', '<C-,>', ':Ttoggle<CR>', opts)
-- utils.map('i', '<C-,>', '<Esc>:Ttoggle<CR>', opts)
-- utils.map('t', '<C-,>', '<C-\\><C-N>:Ttoggle<CR>', opts)

-- spacing
utils.map('n', '<leader>m', [[:set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>]])
utils.map('n', '<leader>t', [[:set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>]])

-- buffers
utils.map("", "<C-l>", [[<Cmd>BufferNext<CR>]], opt) -- go to the next buffer
utils.map("", "<C-h>", [[<Cmd>BufferPrevious<CR>]], opt) -- go to the previous buffer
utils.map("", "<C-PageDown>", [[<Cmd>BufferNext<CR>]], opt) -- go to the next buffer
utils.map("", "<C-PageUp>", [[<Cmd>BufferPrevious<CR>]], opt) -- go to the previous buffer
-- utils.map("", "<C-L>", [[<Cmd>BufferMoveNext<CR>]], opt) -- go to the next buffer
-- utils.map("", "<C-H>", [[<Cmd>BufferMovePrevious<CR>]], opt) -- go to the previous buffer
utils.map("", "<C-x>", [[<cmd>BufferClose<CR>]], opt) -- close the current buffer
utils.map("n", "<C-t>", [[:<C-u>enew<CR>]], opt) -- new buffer
utils.map("n", "<C-t>", [[<ESC>:<C-u>enew<CR>]], opt) -- new buffer
utils.map("n", "gb", [[<cmd>BufferPick<CR>]], opt) 

-- saving
utils.map("n", "<C-s>", [[:<C-u>w<CR>]], opt)
utils.map("i", "<C-s>", [[<Esc>:<C-u>w<CR>]], opt)
utils.map("v", "<C-s>", [[:<C-u>w<CR>]], opt)
utils.map("c", "<C-s>", [[<C-u>w<CR>]], opt)

-- better window navigation
utils.map("n", "<leader>h", [[:wincmd h<CR>]], opt)
utils.map("n", "<leader>j", [[:wincmd j<CR>]], opt)
utils.map("n", "<leader>k", [[:wincmd k<CR>]], opt)
utils.map("n", "<leader>l", [[:wincmd l<CR>]], opt)

-- clear higligthing on escape in normal mode
utils.map("n", "<Esc>", [[:noh<Return><Esc>]], opt)
utils.map("n", "<Esc>^[", [[<Esc>^[ ]], opt)

-- remove without copy
utils.map("n", "<leader>x", [["_x]], opt)
utils.map("n", "<leader>d", [["_d]], opt)
utils.map("x", "<leader>d", [["_d]], opt)
utils.map("x", "<leader>p", [["_dP]], opt)

-- copy
utils.map("n", "<leader>y", [["+y]], opt)
utils.map("v", "<leader>y", [["+y]], opt)
utils.map("n", "<leader>Y", [[gg"+*yG]], opt)
utils.map("n", "<C-c>", [["+y<CR>]], opt)
utils.map("v", "<C-c>", [["+y]], opt)

-- move selected line
utils.map("v", "J", [[:m '>+1<CR>gv=gv]])
utils.map("v", "K", [[:m '<-2<CR>gv=gv]])

-- commenting
-- utils.map("n", "<C-_>", [[:call NERDComment('n', 'Toggle')<CR>]])
-- utils.map("x", "<C-_>", [[:call NERDComment('x', 'Toggle')<CR>]])
utils.map("n", "<C-_>", [[:CommentToggle<CR>]])
utils.map("x", "<C-_>", [[:'<,'>CommentToggle<CR>]])

-- Git fugitive
utils.map("n", "<leader>gs", [[:G<CR>]], opt)
utils.map("n", "<leader>gf", [[:diffget //3]], opt)
utils.map("n", "<leader>gj", [[:diffget //2]], opt)

-- CMake
utils.map("n", "<leader>cg", [[:CMakeGenerate<CR>]])
utils.map("n", "<leader>cb", [[:CMakeBuild<CR>]])
utils.map("n", "<leader>cx", [[:CMakeClean<CR>]])
utils.map("n", "<leader>cc", [[:CMakeClose<CR>]])

-- Google test
utils.map("n", "<leader>gt", [[:GTestRunUnderCursor<CR>]])
utils.map("n", "<leader>gr", [[:GTestRun<CR>]])

-- String operations
utils.map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/]])

-- Undotree
utils.map("n", "<leader>u", [[:UndotreeToggle<CR>]])

--splitjoin
utils.map("n", "sj", [[:SplitjoinJoin<CR>]])
utils.map("n", "sk", [[:SplitjoinSplit<CR>]])

-- FZF
-- utils.map('n', '<Leader>r', ':History<CR>')
-- utils.map('n', '<Leader>b', ':Buffers<CR>')
-- utils.map('n', '<C-p>', ':GFiles --cached --others --exclude-standard<CR>')
-- utils.map('n', '<Leader>f', ':Files<CR>')
-- utils.map('n', '<Leader>s',	 ':BLines<CR>', { silent = false })
-- utils.map('n', '<Leader>S',	 ':Lines<CR>', { silent = false })
-- utils.map('n', '<Leader>ts', ':Rg<CR>', { silent = false })

-- Neo Format
-- utils.map("n", "<leader>ff", [[:Neoformat<CR>]])

utils.map('n', '<C-a>', '<esc>ggVG<CR>')
-- utils.map("n", "<C-aa>", [[ <Cmd> %y+<CR>]], opt)

-- telescope
utils.map("n", "<Leader>gb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]]) 
utils.map("n", "<Leader>b", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]])
utils.map("n", "<Leader>e", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]])
utils.map("n", "<C-p>", [[<Cmd>lua require('telescope.builtin').git_files()<CR>]])
utils.map("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]])
utils.map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').file_browser()<CR>]])
utils.map("n", "<Leader>fm", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]])
utils.map("n", "<Leader>s", [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]]) 
utils.map("n", "<Leader>ts", [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]]) 
-- Telescope current_buffer_fuzzy_find

-- vim.api.nvim_set_keymap("n", "<Leader>ts", [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]], opt)
-- vim.api.nvim_set_keymap("n", "<Leader>s", [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opt)
-- NOTE: Disabled for performance issue, See: fzf
-- utils.map("n", "<Leader>ts", [[<Cmd>lua require('telescope').extensions.fzf_writer.grep()<CR>]])
-- utils.map("n", "<Leader>s", [[<Cmd>lua require('telescope').extensions.fzf_writer.staged_grep()<CR>]])

