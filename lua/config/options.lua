-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.o.linespace = 20
vim.o.termguicolors = true

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h16" -- Or your preferred font
  vim.g.neovide_input_macos_option_key_is_meta = "both"

  -- vim.g.neovide_opacity = 0.97
  -- vim.g.neovide_normal_opacity = 0.97
  -- vim.g.neovide_background_color = "#222436"

  -- opacity start

  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end

  -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_opacity = 0.0
  vim.g.transparency = 0.97
  vim.g.neovide_background_color = "#222436" .. alpha()

  -- opacity end

  vim.opt.linespace = 0
  vim.g.neovide_window_blurred = true

  vim.g.neovide_scale_factor = 0.9
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5
  -- vim.g.neovide_text_gamma = 0.8
  -- vim.g.neovide_text_contrast = 0.1

  vim.g.neovide_floating_blur_amount_x = 8.0
  vim.g.neovide_floating_blur_amount_y = 8.0

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 50
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 25

  vim.g.neovide_floating_corner_radius = 0.5

  -- vim.g.neovide_refresh_rate = 180

  -- vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_no_idle = true
  vim.g.neovide_confirm_quit = true

  vim.g.neovide_cursor_trail_size = 0.5

  -- vim.g.neovide_show_border = true
end
