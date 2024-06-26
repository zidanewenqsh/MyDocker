import pathlib

def convert_encoding(directory_path, file_suffix, src_encoding, dest_encoding):
    # 使用pathlib.Path创建目录路径对象
    path = pathlib.Path(directory_path)
    print("path: ", path)
    print("Converting files with suffix: ", file_suffix)
    # 遍历目录下所有具有特定后缀名的文件
    for file_path in path.rglob(f'*{file_suffix}'):
        # 读取文件内容，假设文件内容不会超过内存限制
        try:
            with file_path.open('r', encoding=src_encoding) as file:
                content = file.read()
        except UnicodeDecodeError:
            print(f'Skipping {file_path} with {src_encoding} encoding')
            continue
        print(f'Read {file_path} with {src_encoding} encoding')
        # 将内容写回文件，使用新的编码格式
        with file_path.open('w', encoding=dest_encoding) as file:
            file.write(content)
        print(f'Converted {file_path} from {src_encoding} to {dest_encoding}')

# 使用例子
convert_encoding(r'/home/shixian/Documents/MyDocker/temp', '.sh', 'gbk', 'utf-8')