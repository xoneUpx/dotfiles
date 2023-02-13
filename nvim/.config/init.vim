call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ambv/black'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plug 'tpope/vim-rhubarb'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"requires ripgrep
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()
lua <<EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.vale,
    },
})
EOF
let mapleader = " "
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
map <leader>r :call ToggleLineNumber()<CR>
map <leader>n :set number<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>R :source /home/bobok/.config/nvim/init.vim<CR>
function! ToggleLineNumber()
  if v:version > 703
    set norelativenumber!
  endif
  set nonumber!
endfunction
nnoremap <silent><leader>p :PlugInstall<CR>
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <leader>ga :Grepper<cr>
nnoremap <leader>gb :Grepper -buffer<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>f :Rg<cr>
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
