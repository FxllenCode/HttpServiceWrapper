-- HttpService Wrapper written by FxllenCode
-- Enjoy! :D
local HttpService = game:GetService("HttpService")
local Promise = require(script.Parent.Promise)

local module = {} 

type Options = {
	Url: string,
	Method: string?,
	Headers: table?,
	Body: string?,
}
function module.Request(options: Options)
	return Promise.new(function(resolve, reject) 
	local function request() 
		local response = HttpService:RequestAsync(options)
		if response.Success then
		resolve(HttpService:JSONDecode(response.Body), response)
		else 
		reject("Error: Request failed with status code " .. response.StatusCode .. " and message " .. response.Body)
		end
	end
	
	
	local Success, Result = pcall(request)
	if not Success then 
		reject("Error: Request Failed: " .. Result)
	end
	end)
	
end

function module.GUID(braces: boolean?)
	return HttpService:GenerateGUID(braces or false)

end

function module.Get(url: string, noCache: boolean?, headers: table?)
	return Promise.new(function(resolve, reject)
		local function request()
			local response = HttpService:GetAsync(url, noCache or false, headers)
			if response.Success then 
			resolve(HttpService:JSONDecode(response.Body), response)
			else 
				reject("Error: Request failed with status code " .. response.StatusCode .. " and message " .. response.Body)
			end
		end
		local Success, Result = pcall(request)
		if not Success then
			reject("Error: Request Failed: " .. Result)
		end
	end)
end
function module.Decode(input: string) 
	return HttpService:JSONDecode(input)
end
function  module.Encode(input: table)
	return HttpService:JSONEncode(input)
end

function module.Post(url: string, luaToEncode: table, content_type: Enum.HttpContentType?, compress: boolean?, headers: table?)
	return Promise.new(function(resolve, reject)

		local function request() 
	local response = HttpService:PostAsync(url, HttpService:JSONEncode(luaToEncode), content_type or Enum.HttpContentType.ApplicationJson, compress or false, headers)
	if response.Success then
		resolve(HttpService:JSONDecode(response.Body), response)
	else 
		reject("Error: Request failed with status code " .. response.StatusCode .. " and message " .. response)
	end
end
local Success, Result = pcall(request)
if not Success then
	reject("Error: Request Failed: " .. Result)
end
end)
end

return module