from flask import Flask, request, jsonify
import brainstorm_module  # Replace with the name of the file containing your AI code

app = Flask(__name__)

previous_entries = []

@app.route('/title', methods=['POST'])
def generate_title():
    entry = request.json['entry']
    title = brainstorm_module.generate_title(entry)
    return jsonify({"title": title})

@app.route('/feedback', methods=['POST'])
def generate_feedback():
    entry = request.json['entry']
    feedback = brainstorm_module.generate_feedback(entry)
    return jsonify({"feedback": feedback})

@app.route('/emotional_rating', methods=['POST'])
def generate_emotional_rating():
    entry = request.json['entry']
    emotional_rating = brainstorm_module.generate_emotional_rating(entry)
    return jsonify({"emotional_rating": emotional_rating})

@app.route('/analytical_response', methods=['POST'])
def generate_analytical_response():
    entry = request.json['entry']
    analytical_response = brainstorm_module.generate_analytical_response(entry)
    return jsonify({"analytical_response": analytical_response})

@app.route('/contextual_response', methods=['POST'])
def generate_contextual_response():
    entry = request.json['entry']
    previous_entries.append(entry)
    past_entries = previous_entries[-3:]
    contextual_response = brainstorm_module.generate_contextual_response(entry, past_entries)
    return jsonify({"contextual_response": contextual_response})

if __name__ == '__main__':
    app.run()
