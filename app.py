import gradio as gr
from transformers import pipeline

# Load your model
model = pipeline("text-classification", model="distilbert-base-uncased-finetuned-sst-2-english")

def predict(text):
    results = model(text)
    return str(results)

# Set up the Gradio interface with correct flagging directory
flagging_directory = "/app/flagged"  # Ensuring the directory exists and is writable

iface = gr.Interface(
    fn=predict,
    inputs="text",
    outputs="text",
    title="Text Classification",
    flagging_dir=flagging_directory  # Correct parameter for specifying the flagging directory
)

if __name__ == "__main__":
    iface.launch()
