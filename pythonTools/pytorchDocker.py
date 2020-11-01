'''
Aim to build image, create contianer and exec the containers quickly.
'''
import argparse

def parse_args():
    parser = argparse.ArgumentParser(description='The CMD commands')

    # General
    parser.add_argument('--docker_file', default='debug')
    
    args = parser.parse_args()
    return args

def main(args):
    print('main methods')


if __name__ == '__main__':
    args = parse_args()
    main(args)