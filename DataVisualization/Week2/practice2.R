library(ggplot2)


# CSV 파일 읽기
pokemon.data <- read.csv("DataVisualization/Week2/pokemon_fix.csv")



str(pokemon.data$is_legendary)

# Q1-1
ggplot(pokemon.data, aes(x=height_m, y=weight_kg)) + 
  geom_point() + 
  labs(x="height_m", y="weight_kg")


#Q1-2
ggplot(pokemon.data, aes(x=log10(height_m), y=log10(weight_kg))) + 
  geom_point() + 
  labs(x="log10(height_m)", y="log10(weight_kg)")

#Q1-3



#Q2-1
# factor인지 판별하는 함수: is_factor(var)
# facet_grid(. ~ generation): 카테고리 변수만 가능하고, generation을 factor
ggplot(pokemon.data, aes(x=factor(generation), y=attack, color=factor(generation))) + 
  geom_point() + 
  labs(x="factor(generation", y="attack", title="Pokemon's attack points for each generation") + 
  facet_grid(. ~generation) +
  theme(axis.text.x=element_blank())


ggplot(pokemon.data, aes(x=factor(generation), y=attack, color=factor(generation))) + 
  geom_point() + 
  labs(x=NULL, y="attack", title="Pokemon's attack points for each generation") + 
  scale_x_discrete(breaks=1:7) +
  theme(axis.title.x=element_blank())  # x축 제목 제거 


# geom_jitter(): 수전증이 있는 것처럼 random noise를 주어서 여러개의 점이 하나의 점으로 보이는 것을 방지
# 정확한 위치가 아니라 살짝 벗어난 곳에 찍음

# coord_equal(): x축과 y축의 칸 간격을 동일하게 -> 단위가 같은데 간격이 다르면 데이터를 왜곡해서 보여줌 

#Q2-2
