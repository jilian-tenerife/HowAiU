import openai

openai.api_key = "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"

previous_entries = []

def generate_contextual_response(entry, past_entries):
    past_context = " ".join(past_entries[-3:])
    prompt = f'''As an AI-powered intelligent mobile diary, my task is to provide a response to the following diary entry, considering the past context:

Past Entries:
"{past_context}"

Current Entry:
"{entry}"

Response:
    '''
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=1000,
        n=1,
        stop=None,
        temperature=0.7,
    )

    return response.choices[0].text.strip()


def generate_title(entry):
    prompt = f'''As an AI-powered intelligent mobile diary, my task is to generate a title for the following diary entry:

"{entry}"

Title:
    '''
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=50,
        n=1,
        stop=None,
        temperature=0.7,
    )

    return response.choices[0].text.strip()

def generate_feedback(entry):
    prompt = f'''As an AI-powered intelligent mobile diary, my task is to provide exhaustive feedback on the following diary entry:

"{entry}"

Feedback:
    '''
    response = openai.Completion.create(
#         engine="text-davinci-003",
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=1000,
        n=1,
        stop=None,
        temperature=0.7,
    )

    return response.choices[0].text.strip()

def generate_emotional_rating(entry):
    prompt = f'''As an AI-powered intelligent mobile diary, my task is to rate the emotional state of the following diary entry on a scale of 0 to 10. I will just return the number only.:

"{entry}"

Emotional Rating:
    '''
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=25,
        n=1,
        stop=None,
        temperature=0.5,
    )

    return response.choices[0].text.strip()

def generate_analytical_response(entry):
    prompt = f'''As an AI-powered intelligent mobile diary, my task is to provide an analytical response that identifies any negative thought patterns or cognitive distortions in the following diary entry in first person:

"{entry}"

Analytical Response:
    '''
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=1000,
        n=1,
        stop=None,
        temperature=0.7,
    )

    return response.choices[0].text.strip()
# while True:
#     # User input
#     user_input = input("\nWhat's the entry for today? (Type 'quit' to exit)\n")

#     if user_input.lower() == 'quit':
#         print('Exiting...')
#         break

#     # Save the input to previous_entries list
#     previous_entries.append(user_input)

#     # Generate Title
#     title = generate_title(user_input)
#     print(f"\n{title}")

#     # Generate Feedback
#     feedback = generate_feedback(user_input)

#     # Generate Emotional Rating
#     emotional_rating = generate_emotional_rating(user_input)

#     # Generate Analytical Response
#     analytical_response = generate_analytical_response(user_input)

#     # If there are at least 3 past entries, generate a contextual response
#     if len(previous_entries) >= 3:
#         contextual_response = generate_contextual_response(user_input, previous_entries)
#         feedback = feedback + '\n\n' + contextual_response

#     # Append Analytical Response to Feedback
#     feedback = feedback + '\n\n' + analytical_response
#     print(f"\n{feedback}")
#     print(f"\nRATING: {emotional_rating}")