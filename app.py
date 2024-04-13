import gradio as gr
from transformers import pipeline

# Load your model
model = pipeline("text-classification", model="distilbert-base-uncased-finetuned-sst-2-english")

def predict(text):
    results = model(text)
    return str(results)

# Set up the Gradio interface
iface = gr.Interface(fn=predict, inputs="text", outputs="text", title="Text Classification")

if __name__ == "__main__":
    iface.launch()
