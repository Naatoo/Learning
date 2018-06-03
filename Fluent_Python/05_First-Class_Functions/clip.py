def clip(text: str, max_len: 'int > 0'=80) -> str:
    end = None
    if len(text) > max_len:
        space_before = text.rfind(' ', 0, max_len)
        if space_before >= 0:
            end = space_before
        else:
            space_after = text.rfind(' ', max_len)
            if space_after >= 0:
                end = space_after
    if end is None:
        end = len(text)
    return text[:end].rstrip()


print(clip('banana ', 6))        # banana
print(clip('banana ', 7))        # banana
print(clip('banana ', 5))        # banana
print(clip('banana split', 6))   # banana
print(clip('banana split', 7))   # banana
print(clip('banana split', 10))  # banana
print(clip('banana split', 11))  # banana
print(clip('banana split', 12))  # banana split
