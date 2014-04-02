# Description:
#   When you say the magic word Coolio makes an appearance.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
module.exports = (robot) ->
  
  IMAGES = [
    'http://blogs.villagevoice.com/music/images/Coolio-575-old.jpg',
    'http://www.aceshowbiz.com/images/wennpic/coolio-3rd-annual-ebay-motors-rpm-xi-event-01.jpg',
    'http://i.telegraph.co.uk/multimedia/archive/02697/coolio_2697794k.jpg',
    'http://static0.therichestimages.com/wp-content/uploads/Coolio.jpg',
    'http://www.sogoodblog.com/wp-content/uploads/2008/02/coolio_large.jpg',
    'http://www.aux.tv/wp-content/uploads/2013/08/Coolio.jpg',
    'http://raramusic.files.wordpress.com/2013/09/coolio.jpg',
    'http://www.rednecklatte.com/wp-content/uploads/2012/12/Coolio.jpg',
    'http://www.unrealitytv.co.uk/wp-content/uploads/2009/01/coolio1.jpg',
    'http://www.recordsale.de/cdpix/c/coolio-i_like_girls_ghetto_square_dance.jpg',
    'http://latimesblogs.latimes.com/photos/uncategorized/2009/03/06/coolio_3.jpeg',
    'http://www.donmega.com/coolio/coolio35.jpg',
    'http://cdn.popdust.com//wp-content/uploads/2012/03/coolio.jpg'
    'http://i.ytimg.com/vi/lm7fq1bvxXI/0.jpg',
    'http://images.starpulse.com/pictures/2012/08/27/previews/Coolio%20and%20Goast-WBU-016321.jpg',
    'http://cdn29.elitedaily.com/wp-content/uploads/2013/08/coolio-miley-elite-daily1.jpg',
    'http://upload.wikimedia.org/wikipedia/en/4/4d/Coolio_-_Gangsta_Walk.jpg',
    'http://www.contactmusic.com/pics/lb/coolio_2_280109/coolio_5239505.jpg',
    'http://img.thesun.co.uk/aidemitlum/archive/01826/coolio620biz_1826312a.jpg'
  ]

  robot.hear /coolio/i, (msg) ->
    img = msg.random IMAGES
    msg.send img
