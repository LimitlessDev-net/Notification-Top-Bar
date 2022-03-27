Config = {}
Messages = {}

CountDownTimer = {}
Countdown = false

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    Config = json.decode(LoadResourceFile(GetCurrentResourceName(),
                                          "./config.json"))
    Messages = json.decode(LoadResourceFile(GetCurrentResourceName(),
                                            "./messages.json"))

    -- Notification Messages
    if Config.NotificationsEnabled then
        Citizen.CreateThread(function()
            while true do
                SendMessageToPlayers(GetRandomMessage())
                Wait(Config.AutoMessageDelay * 1000)
            end
        end)
    end

    -- Player Join Notification
    if Config.JoinNotificationEnabled then
        AddEventHandler('playerConnecting',
                        function(name, setKickReason, deferrals)
            local source = source
            local name = GetPlayerName(source)
            TriggerClientEvent('L_TopBar:SendMessage', -1, string.gsub(
                                   Config.JoinNotificationText, "{name}", name),
                               {0, 255, 0})
        end)
    end

    -- Player Disconnect Notification
    if Config.DisconnectNotificationEnabled then
        AddEventHandler('playerDropped', function(reason)
            local source = source
            local name = GetPlayerName(source)
            TriggerClientEvent('L_TopBar:SendMessage', -1,
                               string.gsub(
                                   string.gsub(
                                       Config.DisconnectNotificationText,
                                       "{name}", name), "{reason}", reason),
                               {255, 0, 0})
        end)
    end

    RegisterCommand("announce", function(source, args)
        if IsPlayerAceAllowed(source, "announce") then
            local message = 'ADMIN | '
            for i = 1, #args do
                message = tostring(message) .. " " .. tostring(args[i])
            end
            TriggerClientEvent('L_TopBar:SendMessage', -1, message, {255, 0, 0})
        end
    end, false)

    RegisterCommand("countdown", function(source, args)
        if not Countdown then
            if CountDownTimer[source] == nil then
                Countdown = true
                CountDownTimer[source] = true
                Citizen.SetTimeout(Config.CountdownTimer * 1000,
                                   function()
                    CountDownTimer[source] = nil
                end)
                local name = GetPlayerName(source)
                for k, v in ipairs({
                    name .. " has triggered the countdown:", "3", "2", "1",
                    "GO!!!"
                }) do
                    TriggerClientEvent('L_TopBar:SendMessage', -1, v,
                                       {0, 255, 0})
                    Citizen.Wait(1000)
                end
                Countdown = false

            else
                TriggerClientEvent('L_TopBar:SendMessage', source,
                                   "The countdown can be made only once in " ..
                                       Config.CountdownTimer ..
                                       " seconds! Please try again later.",
                                   {255, 0, 0})
            end
        end
    end, false)

end)

function GetRandomMessage() return Messages[math.random(#Messages)] end

function SendMessageToPlayers(message, color)
    color = color or Config.DefaultTextColor
    TriggerClientEvent('L_TopBar:SendMessage', -1, message, color)
end

