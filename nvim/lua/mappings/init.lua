local utils = require('utils')

-- keybind list
utils.map("", "<leader>c", '"+y')

-- open terminals  
utils.map('n', '<C-b>', ':Ttoggle<CR>', opts)
utils.map('i', '<C-b>', '<Esc>:Ttoggle<CR>', opts)
utils.map('t', '<C-b>', '<C-\\><C-N>:Ttoggle<CR>', opts)

-- buffers
utils.map("", "<C-l>", [[<Cmd>BufferNext<CR>]], opt) -- go to the next buffer
utils.map("", "<C-h>", [[<Cmd>BufferPrevious<CR>]], opt) -- go to the previous buffer
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
utils.map("n", "<C-_>", [[:call NERDComment('n', 'Toggle')<CR>]])
utils.map("x", "<C-_>", [[:call NERDComment('x', 'Toggle')<CR>]])

-- CMake
utils.map("n", "<leader>cg", [[:CMakeGenerate<CR>]])
utils.map("n", "<leader>cb", [[:CMakeBuild<CR>]])
utils.map("n", "<leader>cx", [[:CMakeClean<CR>]])
utils.map("n", "<leader>cc", [[:CMakeClose<CR>]])

-- Google test
utils.map("n", "<leader>gt", [[:GTestRunUnderCursor<CR>]])
utils.map("n", "<leader>gr", [[:GTestRun<CR>]])

-- FZF
utils.map('n', '<Leader>r', ':History<CR>')
utils.map('n', '<Leader>b', ':Buffers<CR>')
utils.map('n', '<C-p>', ':GFiles --cached --others --exclude-standard<CR>')
utils.map('n', '<Leader>f', ':Files<CR>')
utils.map('n', '<Leader>s',	 ':BLines<CR>', { silent = false })
utils.map('n', '<Leader>S',	 ':Lines<CR>', { silent = false })
utils.map('n', '<Leader>ts', ':Rg<CR>', { silent = false })

-- Neo Format
utils.map("n", "<leader>ff", [[:Neoformat<CR>]])

utils.map('n', '<C-a>', '<esc>ggVG<CR>')
-- utils.map("n", "<C-aa>", [[ <Cmd> %y+<CR>]], opt)

-- Vista tagbar
utils.map('n', '<leader>o', ':Vista!!<CR>') -- toggle tagbar
