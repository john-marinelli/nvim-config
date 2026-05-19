return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  cmd = 'Obsidian',
  --@module 'obsidian'
  --@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
    },
    daily_notes = {
      folder = 'daily',
      template = 'daily',
    },
    templates = {
      folder = 'templates',
      customizations = {
        daily = {
          notes_subdir = 'daily',
          note_id_func = function()
            return os.date('%Y-%m-%d')
          end,
        },
        idea = {
          notes_subdir = 'ideas',
          note_id_func = function(title)
            if title then
              return title:gsub(' ', '-'):gsub('[^A-Za-z0-9%-]', ''):lower()
            end
            return tostring(os.time())
          end,
        },
        note = {
          notes_subdir = 'notes',
          note_id_func = function(title)
            if title then
              return title:gsub(' ', '-'):gsub('[^A-Za-z0-9%-]', ''):lower()
            end
            return tostring(os.time())
          end,
        },
        project = {
          notes_subdir = 'projects',
          note_id_func = function(title)
            if title then
              return title:gsub(' ', '-'):gsub('[^A-Za-z0-9%-]', ''):lower()
            end
            return tostring(os.time())
          end,
        },
        link = {
          notes_subdir = 'links',
          note_id_func = function(title)
            if title then
              return title:gsub(' ', '-'):gsub('[^A-Za-z0-9%-]', ''):lower()
            end
            return tostring(os.time())
          end,
        },
      },
    },
  },
}
