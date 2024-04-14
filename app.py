import gradio as gr
from transformers import pipeline

# Load your model
print("Start the pipeline")
model = pipeline("text-classification", model="distilbert-base-uncased-finetuned-sst-2-english")
print("pipeline is finished")
print("start the predict")
def predict(text):
    results = model(text)
    return str(results)

# Set up the Gradio interface with correct flagging directory
flagging_directory = "/app/flagged"  # Ensuring the directory exists and is writable
print("start gradio")
iface = gr.Interface(
    fn=predict,
    inputs="text",
    outputs="text",
    title="Text Classification",
    flagging_dir=flagging_directory  # Correct parameter for specifying the flagging directory
)
print("End gradio")
if __name__ == "__main__":
    iface.launch(server_name="0.0.0.0",debug=True)
    print("End the program")
