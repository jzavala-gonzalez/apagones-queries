import os
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
    

def get_all_objects(s3_client, prefix=None):
    ''' Get list of all objects in the bucket '''
    paginator = s3_client.get_paginator('list_objects_v2')
    if prefix is None:
        pages = paginator.paginate(Bucket='archiva-apagones')
    else:
        pages = paginator.paginate(Bucket='archiva-apagones', Prefix=prefix)

    for page in pages:
        if 'Contents' in page:
            for obj in page['Contents']:
                yield obj

def download_object(s3_manager, obj_key, local_path, verbose=False):
    ''' Download an object from S3 to a local path '''
    file_directory = os.path.dirname(local_path)
    os.makedirs(file_directory, exist_ok=True)
    if verbose:
        print(f'Downloading {obj_key} to {local_path}')
    # s3_client.download_file('archiva-apagones', obj_key, local_path) # when using just a client
    s3_manager.download(
        bucket='archiva-apagones',
        key=obj_key,
        fileobj=local_path,
    )