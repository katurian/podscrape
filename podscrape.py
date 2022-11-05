import feedparser

feed = feedparser.parse('feed.xml')
urls = []

for entry in feed['entries']:
    for enclosure in entry.get('enclosures'):
        urls.append(enclosure['url'])

urls_file = open('urls.txt', 'a')

for url in urls:
    urls_file.write(f'{url}\n')

urls_file.close()

