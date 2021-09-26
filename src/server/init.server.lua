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

BetterHttp.Post('https://httpbin.org/anything', {text = 'hi!'}, Enum.HttpContentType.ApplicationJson, false):andThen(function(parsedResponse, rawResponse) 
print(parsedResponse)
end):catch(function(error)
	warn(error)
end)