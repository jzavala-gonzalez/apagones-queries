import requests

def save_file(url, fpath):
    r = requests.get(url, stream=True)
    if r.status_code == 200:
        with open(fpath, 'wb') as f:
            for chunk in r.iter_content(1024):
                f.write(chunk)
        print('File saved: %s' % fpath)
    else:
        print('Failed to download file: %s' % url)

def read_file(fpath):
    with open(fpath, 'r') as f:
        return f.read()