#level intermediate

print("Hello World")

def tshirt_cost(s: str) -> float:
    """calculate T shirt cost"""
    return 0.1 * len(s.replace(" ", ""))

def test_tshirt():
    assert tshirt_cost("hi") == 0.2
    assert tshirt_cost("my name is") == 0.8
    assert tshirt_cost("") == 0.0

#1 
def profile(name: str, age: int) -> str:
    return f"{name} is {age} years old!"

def test_profile():
    assert profile("Anthony", 19) == "Anthony is 19 years old!"
#2

def shipping_cost(weight: float) -> int:
    if weight <=1:
        return 5
    elif weight <= 5:
        return 10
    else:
        return 20


