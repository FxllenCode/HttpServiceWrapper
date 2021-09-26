local BetterHttp = require(game.ReplicatedStorage.Common.BetterHttp)
local HttpService = game:GetService("HttpService")
BetterHttp.Request({
    Url = "http://httpbin.org/post",  -- This website helps debug HTTP requests
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"  -- When sending JSON, set this!
			},
			Body = HttpService:JSONEncode({hello = "world"})
}):andThen(function(parsedResponse, rawResponse)
    print(parsedResponse.data)
end):catch(function(error)
    warn(error)
end)

local e = HttpService:JSONDecode({hello = "world"})

BetterHttp.Post("djsdjfhsjdfsjfdshjfhs", e, Enum.HttpContentType.ApplicationJson, false):andThen(function(parsedResponse, rawResponse)
print(parsedResponse)
end):catch(function(error)
	warn(error)
end)