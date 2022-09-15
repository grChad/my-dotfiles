-- Colores para iconos
local colors = {
   c = '#519aba', lock = '#c4c720',
   rs = '#dea584', kt = '#41A162',
   lua = '#51a0cf', mp3 = '#d39ede',
   vim = '#008b8b', mp4 = '#9ea3de',
   py = '#a3b8ef', png = '#c882e7',
   toml = '#39bf39', jpeg = '#c882e7',
   rb = '#ff75a0', jpg = '#c882e7',
   docker = '#384d54', ttf = '#abb2bf',
   html = '#E66B74', rpm = '#fca2aa',
   css = '#61afef', deb = '#a1b7ee',
   js = '#ebcb8b', woff = '#abb2bf',
   ts = '#52B8E5', woff2 = '#abb2bf',
   jsx = '#519ab8', robot = '#abb2bf',
   vue = '#7bc99c', zip = '#f9d71c',
   git = '#F96B6B', out = '#abb2bf',
}
-- +--------------------------------------------------------------------+

-- ┌                                                                    ┐
-- │        Desde aqui, se personalizan los iconos de cualquier         │
-- │              tipo de archivo 'FileType' o extencion.               │
-- └                                                                    ┘
require('nvim-web-devicons').set_icon {
   c = {
      icon = '', color = colors.c, name = 'c'
   },

   deb = {
      icon = '', color = colors.deb, name = 'deb'
   },

   Dockerfile = {
      icon = '', color = colors.docker, name = 'Dockerfile'
   },

   kt = {
      icon = '󱈙', color = colors.kt, name = 'kt'
   },

   lock = {
      icon = '', color = colors.lock, name = 'lock'
   },

   lua = {
      icon = '', color = colors.lua, name = 'lua'
   },

   mp3 = {
      icon = '', color = colors.mp3, name = 'mp3'
   },

   mp4 = {
      icon = '', color = colors.mp4, name = 'mp4'
   },

   out = {
      icon = '', color = colors.out, name = 'out'
   },

   py = {
      icon = '', color = colors.rs, name = 'py'
   },

   ['robots.txt'] = {
      icon = 'ﮧ', color = colors.robot, name = 'robots'
   },

   toml = {
      icon = '', color = colors.toml, name = 'toml'
   },

   ttf = {
      icon = '', color = colors.ttf, name = 'TrueTypeFont'
   },

   rb = {
      icon = '', color = colors.rb, name = 'rb'
   },

   rpm = {
      icon = '', color = colors.rpm, name = 'rpm'
   },

   vue = {
      icon = '﵂', color = colors.vue, name = 'vue'
   },

   woff = {
      icon = '', color = colors.woff, name = 'WebOpenFontFormat'
   },

   woff2 = {
      icon = '', color = colors.woff2, name = 'WebOpenFontFormat2'
   },

   xz = {
      icon = '', color = colors.zip, name = 'xz'
   },

   zip = {
      icon = '', color = colors.zip, name = 'zip'
   },

   rust = {
      icon = '', color = colors.rs, name = 'rs'
   },

   jpg = {
      icon = '', color = colors.jpg, name = 'jpg'
   },

   png = {
      icon = '', color = colors.png, name = 'png'
   },

   jpeg = {
      icon = '', color = colors.jpeg, name = 'jpeg'
   },

   vim = {
      icon = '', color = colors.vim, name = 'vim'
   },

   html = {
      icon = '', color = colors.html, name = 'html'
   },

   css = {
      icon = '', color = colors.css, name = 'css'
   },

   jsx = {
      icon = 'ﰆ', color = colors.js, name = 'jsx'
   },

   tsx = {
      icon = 'ﰆ', color = colors.ts, name = 'tsx'
   },

   md = {
      icon = '', color = colors.kt, name = 'md'
   }
}
