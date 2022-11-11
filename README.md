# Graph-Masking-Pre-training for G2T Generation
This is the official code for EMNLP 2022 paper: [Self-supervised Graph Masking Pre-training for Graph-to-Text Generation](https://arxiv.org/abs/2210.10599).

## Setup
```
pip install -r requirements.txt
```

## Preprocess
### Download Original Dataset
Download [WebNLG+2020](https://gitlab.com/shimorina/webnlg-dataset/tree/master/release_v3.0), [DART](https://github.com/Yale-LILY/dart), [EventNarrative](https://www.kaggle.com/datasets/acolas1/eventnarration).

### Augnemt the Dataset with Level Marker
For WebNLG and DART, you should run the following scripts in `preprocess` folder:
```
python webnlg_tree.py
```
or
```
python dart_tree.py
```
For EventNarrative, just manually add the level marker = 1 to the input triple.
### Generate the Masked Dataset
Use the `generate datasets.ipynb` in `preprocess` folder to generate the masked datasets.

## Pre-training
Before pre-training, check and make sure the data path in `finetune_masked_spans.sh` in `pretraiing` folder is right. Then run:
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
@article{DBLP:journals/corr/abs-2210-10599,
  author    = {Jiuzhou Han and
               Ehsan Shareghi},
  title     = {Self-supervised Graph Masking Pre-training for Graph-to-Text Generation},
  journal   = {CoRR},
  volume    = {abs/2210.10599},
  year      = {2022},
  url       = {https://doi.org/10.48550/arXiv.2210.10599},
  doi       = {10.48550/arXiv.2210.10599},
  eprinttype = {arXiv},
  eprint    = {2210.10599},
  timestamp = {Tue, 25 Oct 2022 14:25:08 +0200},
  biburl    = {https://dblp.org/rec/journals/corr/abs-2210-10599.bib},
  bibsource = {dblp computer science bibliography, https://dblp.org}
}
```
