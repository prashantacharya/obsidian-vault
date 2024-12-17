Tag: [[LLM]], [[Open Source LLM]], [[ollama]], [[llama]]

Didn't get good results with mistral, llama3.2, llama3.2:3b. They were generating summary but they were not generating the summary in the format I was expecting.

I asked Yankee dai if the problem was due to the size of the model I was using.

This is what he had to say about it:

```
Ahh depends on the size and context window of the model. Lengthy research paper ho bhanay 14B or best 32B samma ko might give good result with the structure. Although Llama3.2 smaller model ko context window large cha, sabai context linai sakdaina smaller model le. Ani timro research paper LLM or AI specific cha bhanay it takes the context as instructions from the paper sometimes. Timle majaley grounding instructions mention garna parcha system prompt ma.

Tara personal app ko lagi I prefer Gemini ko API. Flash or Pro has generous daily limits. It should work out of the box with your prompt

There’s an app that shares unused GPU resources for free as well compute ko lagi. Let me find the name

Also kun large model works best for you try garna lai, use groq or fireworks ai. Free API access with good daily limits cha. Sabai hosted open source models haru cha.

Also try the “-instruct” model, it should have somewhat better results.

Also timro GPU ramro cha bhanay use fp16 models, natra q8 ones. Q8 ones are a bit faster but accurate nahuna sakcha. fp16 is better if you have to choose among the list.
```


The tool that Yankee dai mentioned about that shares unused GPU resources for free.
https://github.com/Haidra-Org/AI-Horde?tab=readme-ov-file#getting-started-with-ai-horde



