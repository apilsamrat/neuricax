# 🧠 NeuricaX

> AI-Driven Brain Tumor Detection and Classification — built with Flutter + TFLite.

NeuricaX is a mobile-first health-tech solution that leverages on-device machine learning to detect and classify brain tumors from MRI scans. Designed to empower both patients and healthcare professionals, it delivers accurate predictions without needing cloud processing.

---

## 🚀 Features

- 🧬 Detects: **Glioma**, **Meningioma**, **Pituitary Tumor**, and **No Tumor**
- 🤖 On-device inference using **TensorFlow Lite**
- 📷 MRI scan image picker and preview
- 🔐 Secure, offline processing (no data leaves the device)
- 💡 Minimal UI with intuitive UX for ease of use
- 📊 Result visualization with probability scores

---

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **TensorFlow Lite**
- **tflite_flutter v0.11.0**
- **Provider / Riverpod** (state management)
- **Image Picker**, **Path Provider**, etc.

---

## 🧪 Model Details

- Trained using a curated brain MRI dataset
- Input: `224x224` preprocessed grayscale images
- Output: Multiclass classification across 4 categories
- Accuracy: ~95% (on validation set)

---

## 📦 Getting Started

```bash
git clone https://github.com/your-username/NeuricaX.git
cd NeuricaX
flutter pub get
flutter run
```

> ⚠️ Make sure your emulator or physical device supports TFLite.

---

## 📁 Project Structure

```
lib/
├── main.dart
├── screens/
├── widgets/
├── services/
└── model/
assets/
├── model.tflite
└── labels.txt
```

---

## 🙌 Team

- 👨‍💻 Apil Samrat Poudel — Flutter Dev, AI Integration
- 👩‍⚕️ [Name] — Medical Advisor, Clinical Validation

---

## 📜 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for more info.

---

## 💬 Feedback

Drop your thoughts, suggestions, or bugs [here](https://github.com/apilsamrat/NeuricaX/issues). We’re all ears. 👂
