def convert_minutes_to_hours(minutes):
    """
    Convert minutes into hours and minutes.
    Example: 130 → 2 hrs 10 minutes
    """
    hours = minutes // 60
    remaining_minutes = minutes % 60
    return f"{hours} hrs {remaining_minutes} minutes"

# --- Main Program ---
if __name__ == "__main__":
    try:
        user_input = int(input("Enter minutes: "))
        result = convert_minutes_to_hours(user_input)
        print("Converted Time:", result)
    except ValueError:
        print("Please enter a valid integer value for minutes.")
