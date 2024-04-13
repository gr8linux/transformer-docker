import gradio as gr
from transformers import pipeline
import os

# Load your model
model = pipeline("text-classification", model="distilbert-base-uncased-finetuned-sst-2-english")

def predict(text):
    results = model(text)
    return str(results)


# Set a flagging directory in the user's home directory
flagging_directory = "/home/myuser/flagged"

# Ensure the directory exists
os.makedirs(flagging_directory, exist_ok=True)
# Set up the Gradio interface
iface = gr.Interface(
    fn=predict,
    inputs="text",
    outputs="text",
    title="Text Classification",
    flagging_options={"dir": flagging_directory}
)


#iface = gr.Interface(fn=predict, inputs="text", outputs="text", title="Text Classification")

if __name__ == "__main__":
    iface.launch()
