# 1. 载入ggplot2
library(ggplot2)

# 2. 创建数据
mydata <- data.frame(
  groups = LETTERS[1:5],
  values = c(15, 18, 30, 8, 29)
)
mydata

# 3. 一个基础的饼图
ggplot(mydata, aes(x = "", y = values, fill = groups)) +
  geom_bar(stat = "identity") +
  coord_polar("y") #极坐标系，夹角根据y轴上变量

# 4. 修饰饼图
ggplot(mydata, aes(x = "", y = values, fill = groups)) +
  geom_bar(stat = "identity",
           colour = "white",
           size = 1,
           alpha = 0.8) +
  coord_polar("y") +
  theme_void()

# 5. 增加文本说明
ggplot(mydata, aes(x = "", y = values, fill = groups)) +
  geom_bar(stat = "identity",
           colour = "white") +
  coord_polar("y") +
  geom_text(aes(label = values),
            position = position_stack(vjust = 0.5),
            colour = "white") +
  scale_fill_brewer(palette = "Set1") +
  theme_minimal()
  
# 增加百分比
ggplot(mydata, aes(x = "", y = values, fill = groups)) +
  geom_bar(stat = "identity",
           colour = "white") +
  coord_polar("y") +
  geom_text(aes(label = paste0(round(values/sum(values)*100, 1), "%")),
            position = position_stack(vjust = 0.5),
            colour = "white") +
  scale_fill_brewer(palette = "Set1") +
  theme_void()
