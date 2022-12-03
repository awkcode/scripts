function length_of_file(filename)
    local fh = assert(io.open(filename, "rb"))
    local len = assert(fh:seek("end"))
    fh:close()
    return len 
end

function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

function read_all(filename)
    local fh = assert(io.open(filename, "rb"))
    local contents = assert(fh:read("a"))
    fh:close()
    return contents
end

-- operate on all the string -- efficient  
-- or looping line by line   -- more informations like line numbers 
-- grep ??

function read_n_match()
    -- check if the file exist
    local st = read_all(arg[1])
    local matches = string.find(st, '([%p-%w]+)(%(.*%))')
    -- a loop over the file after newline 
    local i = 0 
    while true do 
        i = string.find(st, "\n", i+1) --find next newline

        if i == nil then break end
    end
    print(string.find(st, '%(')) 
    print(matches)
end

read_n_match()

