# Graph-Masking-Pre-training for G2T Generation
This is the official code for EMNLP 2022 paper: [Self-supervised Graph Masking Pre-training for Graph-to-Text Generation](https://aclanthology.org/2022.emnlp-main.321/).

## Setup
```
pip install -r requirements.txt
```

## Preprocess
### Step 1: Download Original Dataset
We use [WebNLG+2020](https://gitlab.com/shimorina/webnlg-dataset/tree/master/release_v3.0), [DART](https://github.com/Yale-LILY/dart), [EventNarrative](https://www.kaggle.com/datasets/acolas1/eventnarration) in this experiment.

### Step 2: Augnemt the Dataset with Level Marker
For WebNLG and DART, you should run the following scripts in `preprocess` folder:
```
python webnlg_tree.py
```
or
```
python dart_tree.py
```
For EventNarrative, just manually add the level marker = 1 to the input triple.

### Step 3: Generate the Masked Dataset
Use the `generate datasets.ipynb` in `preprocess` folder to generate the masked datasets.

## Pre-training
Before pre-training, check and make sure the data path in `finetune_masked_spans.sh` in `pretraining` folder is right. Then run:
```
./finetune_masked_spans.sh t5-large 0
```

## Finetuning
Before finetuning, make sure the checkpoint of the pre-training model is saved and indicated in the parameter `model_name_or_path` of `finetune_t5_large.sh` in `finetuning` folder. Then run:
```
./finetune_t5_large.sh
```

## Citation
```
@inproceedings{han-shareghi-2022-self,
    title = "Self-supervised Graph Masking Pre-training for Graph-to-Text Generation",
    author = "Han, Jiuzhou  and
      Shareghi, Ehsan",
    booktitle = "Proceedings of the 2022 Conference on Empirical Methods in Natural Language Processing",
    month = dec,
    year = "2022",
    address = "Abu Dhabi, United Arab Emirates",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2022.emnlp-main.321",
    pages = "4845--4853",
    abstract = "Large-scale pre-trained language models (PLMs) have advanced Graph-to-Text (G2T) generation by processing the linearised version of a graph. However, the linearisation is known to ignore the structural information. Additionally, PLMs are typically pre-trained on free text which introduces domain mismatch between pre-training and downstream G2T generation tasks. To address these shortcomings, we propose graph masking pre-training strategies that neither require supervision signals nor adjust the architecture of the underlying pre-trained encoder-decoder model. When used with a pre-trained T5, our approach achieves new state-of-the-art results on WebNLG+2020 and EventNarrative G2T generation datasets. Our method also shows to be very effective in the low-resource setting.",
}
```
