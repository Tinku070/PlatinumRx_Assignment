def remove_duplicates(input_string):
    """
    Remove duplicate characters from a string using a loop.
    Keeps only the first occurrence of each character.
    """
    result = ""
    for char in input_string:
        if char not in result:
            result += char
    return result

# --- Main Program ---
if __name__ == "__main__":
    user_input = input("Enter a string: ")
    output = remove_duplicates(user_input)
    print("String without duplicates:", output)
