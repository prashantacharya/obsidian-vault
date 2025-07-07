tags: [[Machine Learning]], [[Large Language Models]]

**Important Resources**
1. https://github.com/rasbt/LLMs-from-scratch - Build an LLM from scratch courses
2. https://youtube.com/playlist?list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&si=K5cOOH_VX6a7Z06Y - 3b1b Playlist


**Transformer Architecture**

This is a diagram from **Attention Is All You Need**.

![[transformer architecture.png]]


# 3B1B Transformer Video Summary (with Math)

This document summarizes the key steps of the Transformer architecture as explained in the 3Blue1Brown video, augmented with mathematical notation.

1.  **Input Tokenization:**
    Input text is first processed into a sequence of discrete units called **tokens**. This involves breaking down the text into words, subwords, or characters. Each unique token is assigned a unique integer ID.
    For a given input sequence of $L$ tokens, we get a sequence of IDs:
    $$
    \text{Input Sequence} = (t_1, t_2, \dots, t_L)
    $$
    Where $t_i$ is the integer ID for the $i$-th token.

2.  **Token Embedding and Positional Encoding:**
    The integer IDs of the tokens are converted into numerical vector representations called **embeddings**.
    Initially, these embeddings (the values in the embedding matrix) are often assigned randomly. During the training process, these values are iteratively adjusted so that semantically similar tokens have similar embedding vectors.

    The **Embedding Matrix** $W_E$ maps each token ID to its $D$-dimensional embedding vector.
    $$
    W_E =
    \begin{pmatrix}
    e_{1,1} & e_{1,2} & \dots & e_{1,D} \\
    e_{2,1} & e_{2,2} & \dots & e_{2,D} \\
    \vdots & \vdots & \ddots & \vdots \\
    e_{V,1} & e_{V,2} & \dots & e_{V,D}
    \end{pmatrix}_{V \times D}
    $$
    Here:
    * $V$ (Vocabulary Size) refers to the total number of unique tokens in the vocabulary. For GPT-3, $V$ is approximately **50,257**.
    * $D$ (Embedding Dimension) represents the size of each embedding vector. For the largest GPT-3 models (like Davinci), $D$ is **12,288**.

    To obtain the embedding vector $x_i$ for a token $t_i$, we effectively look up the row corresponding to $t_i$ in $W_E$. If we represent the token $t_i$ as a one-hot encoded vector $o_i$ (a vector of length $V$ with a $1$ at the index corresponding to $t_i$ and $0$s elsewhere), the embedding $x_i$ is:
    $$
    x_i = o_i^T W_E \quad \text{where } x_i \in \mathbb{R}^D
    $$

    To account for the order of tokens in the sequence, a **Positional Embedding** ($P_i$) corresponding to the token's position $i$ is added to the token's embedding:
    $$
    \text{Input Embedding for position } i = x_i + P_i
    $$
    After training the model, the embeddings of words are structured in such a way that similar words are grouped together in the $D$-dimensional space. For example: the word "cat" might be geometrically close to "beast" and "monster" in this embedding space.

3.  **Attention Layer:**
    The sequence of combined token and positional embeddings is then passed through an attention layer. (More on attention below.)

4.  **Multi-Layered Perceptron (MLP):**
    The output of the attention layer for each token, let's denote it as $H_{attn} \in \mathbb{R}^{D}$, is then passed through a Multi-Layered Perceptron (also known as a Feed-Forward Network). This typically consists of at least two linear transformations separated by a non-linear activation function.
    For a single output from the attention layer, $H_{attn}$, the MLP performs:
    $$
    Y_1 = \text{ReLU}(H_{attn} W_1 + b_1) \\
    Y_{MLP} = Y_1 W_2 + b_2
    $$
    Where $W_1, W_2$ are weight matrices and $b_1, b_2$ are bias vectors, learned during training. $\text{ReLU}$ is a common activation function, $\text{ReLU}(z) = \max(0, z)$.

5.  **Repeated Layers:**
    Steps 3 (Attention Layer) and 4 (Multi-Layered Perceptron) are repeated multiple times in stacked **Transformer Blocks**. This allows the model to learn increasingly complex relationships and representations. A typical large Transformer model can have dozens of such stacked layers.

6.  **Unembedding Transformation:**
    After passing through the final Transformer block, the output corresponding to the last token in the sequence (or the output of a special token indicating the prediction position), let's call it $H_{final} \in \mathbb{R}^D$, is multiplied by an **Unembedding Matrix** $W_U$.
    This $W_U$ matrix transforms the $D$-dimensional representation back into a $V$-dimensional vector, where $V$ is the vocabulary size. Essentially, $W_U$ can often be seen as the transpose of the embedding matrix $W_E^T$, or a separate matrix of similar dimensions.
    $$
    W_U \in \mathbb{R}^{D \times V}
    $$
    The result of this multiplication, let's call it $Z$, is a vector of logits, where each component corresponds to the likelihood of a token in the vocabulary:

	$$
H_{final} = \begin{pmatrix} h_1 & h_2 & \dots & h_D \end{pmatrix}_{1 \times D}
$$
$$
W_U =
\begin{pmatrix}
w_{1,1} & w_{1,2} & \dots & w_{1,V} \\
w_{2,1} & w_{2,2} & \dots & w_{2,V} \\
\vdots & \vdots & \ddots & \vdots \\
w_{D,1} & w_{D,2} & \dots & w_{D,V}
\end{pmatrix}_{D \times V}
$$
    $$
    Z = H_{final} W_U \quad \text{where } Z \in \mathbb{R}^V
    $$

7.  **Softmax Prediction:**
    The vector of logits $Z$ is then passed through a **Softmax function** to convert these raw scores into probabilities. The softmax function ensures that all probabilities are positive and sum up to 1.
    For each component $z_k$ in $Z$, the probability $P_k$ of the $k$-th token being the next word is:
    $$
    P_k = \text{Softmax}(Z)_k = \frac{e^{z_k}}{\sum_{j=1}^{V} e^{z_j}}
    $$
    The token with the highest probability $P_k$ is then selected as the predicted next word.