#ifndef __CONSTRUTOR_V2_TAB8_SINAIS_MQH__
#define __CONSTRUTOR_V2_TAB8_SINAIS_MQH__

class CTab8SinaisV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(window_index,tabs,tab_index,"Estrutura reservada para sinais. Aqui voce pode quebrar depois em filtros, cruzamentos, sobrecompra e demais montagens."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_SINAIS_MQH__
