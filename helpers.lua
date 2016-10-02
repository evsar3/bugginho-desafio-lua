function getOS()
	local ret = ""
	
	local popen_status, popen_result = pcall(io.popen, "")
	
	if popen_status then
		popen_result:close()
		ret = "unix"
	else
		ret = "windows"
	end
	
	return ret
end

function fileExists(name)
	local file = io.open(name, "r")

	if file ~= nil then
		io.close(file)

		return true
	else
		return false
	end
end

function getFileContents(filePath)
	local file = io.open(filePath, "rb")
	local content = file:read("*all")

	file:close()

	return content
end

function setFileContents(filePath, content)
	local file = io.open(filePath, "w")
	
	file:write(content)

	file:close()
end

function split(inputstr, delim)
	if delim == nil then
		delim = "%s"
	end

	local t = {}; i = 1

	for str in string.gmatch(inputstr, "([^" .. delim .. "]+)") do
		t[i] = str
		i = i + 1
	end
	
	return t
end