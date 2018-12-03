#!/usr/bin/env python

import sys

def get_common_char_str(box_id_1, box_id_2):
    common_chars = []
    diff = 0

    for i in range(0, len(box_id_1)):
        c = box_id_1[i : i + 1]
        if c == box_id_2[i : i + 1]:
            common_chars.append(c)
        else:
            diff += 1
    if diff == 1:
        return ''.join(common_chars)
    return ''

def get_correct_box_common_char_str(box_ids):
    box_count = len(box_ids)
    for i in range(0, box_count - 1):
        for j in range(i + 1, box_count):
            str = get_common_char_str(box_ids[i], box_ids[j])
            if str != '': return str
    return ''

box_ids = [box_id.rstrip() for box_id in sys.stdin]
print get_correct_box_common_char_str(box_ids)
