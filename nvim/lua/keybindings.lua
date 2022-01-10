local utils = require('utils')

-- keybind list
utils.map("", "<leader>c", '"+y')

-- open terminals
-- utils.map('n', '<C-,>', ':Ttoggle<CR>', opts)
-- utils.map('i', '<C-,>', '<Esc>:Ttoggle<CR>', opts)
-- utils.map('t', '<C-,>', '<C-\\><C-N>:Ttoggle<CR>', opts)
utils.map('t', '<esc>', [[<C-\><C-n>]])

-- spacing
utils.map('n', '<leader>m', [[:set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>]])
utils.map('n', '<leader>t', [[:set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>]])

-- buffers
utils.map("", "<C-l>", [[<Cmd>BufferNext<CR>]]) -- go to the next buffer
utils.map("", "<C-h>", [[<Cmd>BufferPrevious<CR>]]) -- go to the previous buffer
utils.map("", "<C-PageDown>", [[<Cmd>BufferNext<CR>]]) -- go to the next buffer
utils.map("", "<C-PageUp>", [[<Cmd>BufferPrevious<CR>]]) -- go to the previous buffer
-- utils.map("", "<C-L>", [[<Cmd>BufferMoveNext<CR>]], opt) -- go to the next buffer
-- utils.map("", "<C-H>", [[<Cmd>BufferMovePrevious<CR>]], opt) -- go to the previous buffer
utils.map("", "<C-x>", [[<cmd>BufferClose<CR>]]) -- close the current buffer
utils.map("", "<C-X>", [[<cmd>BufferClose!<CR>]]) -- force close the current buffer
utils.map("n", "<C-t>", [[:<C-u>enew<CR>]]) -- new buffer
utils.map("n", "<C-t>", [[<ESC>:<C-u>enew<CR>]]) -- new buffer
utils.map("n", "gb", [[<cmd>BufferPick<CR>]])
utils.map("n", "<Leader>1", [[<Cmd>BufferGoto 1<CR>]])
utils.map("n", "<Leader>2", [[<Cmd>BufferGoto 2<CR>]])
utils.map("n", "<Leader>3", [[<Cmd>BufferGoto 3<CR>]])
utils.map("n", "<Leader>4", [[<Cmd>BufferGoto 4<CR>]])
utils.map("n", "<Leader>5", [[<Cmd>BufferGoto 5<CR>]])
utils.map("n", "<Leader>6", [[<Cmd>BufferGoto 6<CR>]])
utils.map("n", "<Leader>7", [[<Cmd>BufferGoto 7<CR>]])
utils.map("n", "<Leader>8", [[<Cmd>BufferGoto 8<CR>]])
utils.map("n", "<Leader>9", [[<Cmd>BufferGoto 9<CR>]])
utils.map("n", "<Leader>0", [[<Cmd>BufferGoto 10<CR>]])
utils.map('n', '<leader><leader>', ':b#<CR>')

-- saving
utils.map("n", "<C-s>", [[:<C-u>w<CR>]])
utils.map("i", "<C-s>", [[<Esc>:<C-u>w<CR>]])
utils.map("v", "<C-s>", [[:<C-u>w<CR>]])
utils.map("c", "<C-s>", [[<C-u>w<CR>]])

-- better window navigation
utils.map("n", "<leader>h", [[:wincmd h<CR>]])
utils.map("n", "<leader>j", [[:wincmd j<CR>]])
utils.map("n", "<leader>k", [[:wincmd k<CR>]])
utils.map("n", "<leader>l", [[:wincmd l<CR>]])

utils.map("n", "<leader>ds", [[:wincmd s<CR>]])
utils.map("n", "<leader>dv", [[:wincmd v<CR>]])

utils.map('n', '<M-j>', '<cmd>resize -2<CR>')
utils.map('n', '<M-k>', '<cmd>resize +2<CR>')
utils.map('n', '<M-h>', '<cmd>vertical resize -2<CR>')
utils.map('n', '<M-l>', '<cmd>vertical resize +2<CR>')

-- clear higligthing on escape in normal mode
utils.map("n", "<Esc>", [[:noh<Return><Esc>]])
utils.map("n", "<Esc>^[", [[<Esc>^[ ]])

-- remove without copy
utils.map("n", "<leader>x", [["_x]])
utils.map("n", "<leader>d", [["_d]])
utils.map("x", "<leader>d", [["_d]])
utils.map("x", "<leader>p", [["_dP]])

-- copy&paste
utils.map("n", "<leader>y", [["+y]])
utils.map("v", "<leader>y", [["+y]])
utils.map("n", "<leader>Y", [[gg"+*yG]])
utils.map("n", "<C-c>", [["+y<CR>]])
utils.map("v", "<C-c>", [["+y]])
utils.map('i', '<C-z>', '<C-o>u')
utils.map('i', '<C-v>', '<C-g>u<Cmd>set paste<CR><C-r>+<Cmd>set nopaste<CR>')
utils.map('v', '<C-x>', '<C-g>u<Cmd>set paste<CR><C-r>+<Cmd>set nopaste<CR>')

-- command mode
utils.map('c', '<C-a>', '<Home>')
utils.map('c', '<C-e>', '<End>')

-- insert mode
utils.map('i', '<C-j>', '<Down>')
utils.map('i', '<C-k>', '<Up>')
utils.map('i', '<C-h>', '<Left>')
utils.map('i', '<C-l>', '<Right>')

-- Better indenting
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')

-- move selected line
utils.map("v", "J", [[:m '>+1<CR>gv=gv]])
utils.map("v", "K", [[:m '<-2<CR>gv=gv]])

-- commenting
utils.map("n", "<C-_>", [[:CommentToggle<CR>]])
utils.map("x", "<C-_>", [[:'<,'>CommentToggle<CR>]])

-- Git
utils.map('n', '<leader>gg', '<cmd>Neogit<CR>', { noremap = true, silent = true })
utils.map("n", "<leader>gs", [[:G<CR>]])
utils.map("n", "<leader>gf", [[:diffget //2<CR>]])
utils.map("n", "<leader>gj", [[:diffget //3<CR>]])
utils.map("n", "<leader>do", [[:DiffviewOpen<CR>]])
utils.map("n", "<leader>,", [[:G ftp push --insecure<CR>]])

-- CMake
utils.map("n", "<leader>cg", [[:CMake configure<CR>]])
utils.map("n", "<leader>cb", [[:CMake build<CR>]])
utils.map("n", "<leader>cB", [[:CMake build_all<CR>]])
utils.map("n", "<leader>cr", [[:CMake run<CR>]])
utils.map("n", "<leader>cd", [[:CMake debug<CR>]])
utils.map("n", "<leader>cx", [[:CMake build_and_run<CR>]])
utils.map("n", "<leader>cX", [[:CMake build_and_debug<CR>]])
utils.map("n", "<leader>ca", [[:CMake set_target_args<CR>]])
utils.map("n", "<leader>cs", [[:Telescope cmake select_target<CR>]])
utils.map("n", "<leader>ct", [[:Telescope cmake select_build_type<CR>]])
utils.map('n', 'gh', '<Cmd>ClangdSwitchSourceHeader<CR>')

-- Google test
utils.map("n", "<leader>gt", [[:GTestRunUnderCursor<CR>]])
utils.map("n", "<leader>gr", [[:GTestRun<CR>]])

-- String operations
utils.map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/]])

-- Zen mode
utils.map("n", "<leader>z", [[:ZenMode<CR>]])

-- Undotree
utils.map("n", "<leader>u", [[:UndotreeToggle<CR>]])

--splitjoin
utils.map("n", "sj", [[:SplitjoinJoin<CR>]])
utils.map("n", "sk", [[:SplitjoinSplit<CR>]])

-- Neo Format
utils.map("n", "<leader>fd", [[:Neoformat<CR>]])

utils.map('n', '<C-a>', '<esc>ggVG<CR>')
-- utils.map("n", "<C-aa>", [[ <Cmd> %y+<CR>]], opt)

utils.map('n', '<leader>ql', [[<cmd>lua require('persistence').load()<CR>]])

-- telescope
utils.map("n", "<Leader>gb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]])
utils.map("n", "<Leader>b", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]])
utils.map("n", "<Leader>e", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]])
-- utils.map("n", "<Leader>e", [[<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>]])
utils.map("n", "<C-p>", [[<Cmd>lua require('utils').telescope_find_files()<CR>]])
utils.map("n", "<C-g>", [[<Cmd>lua require('telescope.builtin').git_status()<CR>]])
utils.map("n", "<leader>gc", [[<Cmd>lua require('telescope.builtin').git_commits()<CR>]])
utils.map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').file_browser()<CR>]])
utils.map("n", "<Leader>fm", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]])
utils.map("n", "<Leader>s", [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
utils.map("n", "<Leader>ts", [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]])

utils.map('n', '<a-n>', [[<cmd>lua require('illuminate').next_reference{wrap=true}<cr>]])
utils.map('n', '<a-p>', [[<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<cr>]])

vim.cmd([[

cnoreabbrev PresentMode :lua require('themes').switchColorScheme('gruvbox-material-light')

]])
