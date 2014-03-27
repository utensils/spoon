# Description:
#   A way to interact with the Google Images API.
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.
#   hubot animate me <query> - The same thing as `image me`, except adds a few parameters to try to return an animated GIF instead.
#   hubot mustache me <url> - Adds a mustache to the specified URL.
#   hubot mustache me <query> - Searches Google Images for the specified query and mustaches it.
#   hubot image|animate|mustache me nsfw <query> - Turns off Google Images safe serch.

module.exports = (robot) ->
  robot.respond /(image|img)( me)? (nsfw )?(.*)/i, (msg) ->
    nsfw = if msg.match[3]? then true else false
    imageMe msg, msg.match[4], nsfw, (url) ->
      msg.send url

  robot.respond /animate( me)? (nsfw )?(.*)/i, (msg) ->
    nsfw = if msg.match[2]? then true else false
    imageMe msg, msg.match[3], nsfw, true, (url) ->
      msg.send url

  robot.respond /(?:mo?u)?sta(?:s|c)he?(?: me)? (nsfw )?(.*)/i, (msg) ->
    type = Math.floor(Math.random() * 6)
    mustachify = "http://mustachify.me/#{type}?src="
    imagery = msg.match[2]
    nsfw = if msg.match[1]? then true else false

    if imagery.match /^https?:\/\//i
      msg.send "#{mustachify}#{imagery}"
    else
      imageMe msg, imagery, nsfw, false, true, (url) ->
        msg.send "#{mustachify}#{url}"

imageMe = (msg, query, nsfw, animated, faces, cb) ->
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  q.safe    = 'off' if typeof nsfw is 'boolean' and nsfw is true
  q.imgtype = 'animated' if typeof animated is 'boolean' and animated is true
  q.imgtype = 'face' if typeof faces is 'boolean' and faces is true
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"

