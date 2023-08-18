LanguageSwitcher = LanguageSwitcher or {}
LanguageSwitcher.name = "LanguageSwitcher"
LanguageSwitcher.version = "1.0.0"
LanguageSwitcher.slashCommandLong = "/language"
LanguageSwitcher.slashCommandShort = "/ls"

local languages = {"de", "en", "es", "fr", "ru", "jp", "zh"}


local function RegisterSlashCommands()
    SLASH_COMMANDS[LanguageSwitcher.slashCommandLong] = function(str)
        if str == "" then
            d("supported languages: " .. table.concat(languages, " ,"))
            return
        end

        for _, language in ipairs(languages) do
            if str == language then
                d("language will switch to " .. language)
                SetCVar("language.2", language)
                return
            end
        end

        d("language not found")

    end
end

EVENT_MANAGER:RegisterForEvent(LanguageSwitcher.name, EVENT_ADD_ON_LOADED, function(_, name)
    if name == LanguageSwitcher.name then
        RegisterSlashCommands()
        EVENT_MANAGER:UnregisterForEvent(LanguageSwitcher.name, EVENT_ADD_ON_LOADED)
    end
end)




