import dracula.draw

config.load_autoconfig()

c.fonts.default_family ='Iosevka'
c.fonts.default_size = '16pt'

c.content.geolocation = False
c.content.pdfjs = False
c.content.dns_prefetch = False
c.content.notifications.enabled = False

#
# ask if site load raise ssl error, block
# silently if third party raise ssl error.
#
c.content.tls.certificate_errors = 'ask-block-thirdparty'

c.completion.height = '20%'
c.completion.cmd_history_max_items = 2
c.completion.min_chars = 3
c.completion.web_history.max_items = 10

c.downloads.location.prompt = False
c.downloads.location.directory = '~/downloads/'
c.downloads.remove_finished = 3000

c.zoom.default = '100%'

c.url.searchengines = {
        'DEFAULT': 'https://google.ca/search?hl=eng&q={}',
        '!amazon': 'https://www.amazon.ca/s?k={}',
        '!github': 'https://github.com/search?o=desc&s=stars&q={}',
        '!gist': 'https://gist.github.com/search?q={}',
        '!images': 'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
        '!maps': 'https://www.google.com/maps/search/{}',
        '!youtube': 'https://www.youtube.com/results?search_query={}',
        '!reddit': 'https://www.reddit.com/search?q={}'
}
c.url.start_pages = 'https://google.ca/'

c.fileselect.folder.command = ["st", "-e", "ranger", "--choosefiles={}"]
c.fileselect.multiple_files.command = ["st", "-e", "ranger", "--choosefiles={}"]
c.fileselect.single_file.command = ["st", "-e", "ranger", "--choosefiles={}"]
c.fileselect.handler = "external"

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})
