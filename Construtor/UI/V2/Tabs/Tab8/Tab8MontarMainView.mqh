#ifndef __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__
#define __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__

#include "Tab8Shared.mqh"
#include "Tab8MontarSlotCard.mqh"

class CTab8MontarMainView : public CEF_CWndCreate
  {
private:
   CEF_CWndCreate        *m_host;
   bool                   m_created;
   bool                   m_is_active;
   int                    m_window_index;
   int                    m_tab_index;

   CTab8MontarSlotCard    m_slots[4];
   CEF_CFrame             m_logic_card;
   CEF_CTextLabel         m_logic_title;
   CEF_CTextLabel         m_logic_note;
   CEF_CTextLabel         m_logic_cols[6];
   CEF_CComboBox          m_logic_operator_combo[5];
   CEF_CComboBox          m_logic_candle_combo[5];
   CEF_CComboBox          m_logic_value_combo[5];
   CEF_CComboBox          m_logic_compare_combo[5];
   CEF_CComboBox          m_logic_compare_value_combo[5];
   CEF_CComboBox          m_logic_compare_candle_combo[5];
   int                    m_logic_slot_last[4];

   void SetLabelVisible(CEF_CTextLabel &label,const bool visible)
     {
      if(visible)
         label.Show();
      else
         label.Hide();
      label.Update(true);
     }

   void SetFrameVisible(CEF_CFrame &frame,const bool visible)
     {
      if(visible)
         frame.Show();
      else
         frame.Hide();
      frame.Update(true);
     }

   void SetComboVisible(CEF_CComboBox &combo,const bool visible)
     {
      if(visible)
         combo.Show();
      else
         combo.Hide();
      combo.Update(true);
     }

   bool CreateComboControl(CEF_CComboBox &combo,CElement &owner,CEF_CTabs &tabs,const int x,const int y,const int width,const int list_height,string &items[],const int selected_index,const color border)
     {
      combo.MainPointer(owner);
      tabs.AddToElementsArray(m_tab_index,combo);
      combo.ItemsTotal(ArraySize(items));
      for(int i=0;i<ArraySize(items);i++)
         combo.SetValue(i,items[i]);
      V2StyleCombo(combo,border,width,list_height,width-2);
      if(!combo.CreateComboBox("",x,y))
         return(false);
      m_host.RegisterElement(m_window_index,combo);
      combo.SelectItem(V2ClampIndex(selected_index,0,ArraySize(items)-1));
      return(true);
     }

   void BuildLogicValueItems(string &items[])
     {
      ArrayResize(items,84);
      int total=0;

      items[total++]="Nao usar";
      items[total++]="Valor absoluto";
      items[total++]="Valor em pontos";
      items[total++]="Preco de entrada";
      items[total++]="Preco medio";
      items[total++]="Preco atual";
      items[total++]="Fechamento da vela";
      items[total++]="Abertura da vela";
      items[total++]="Maxima da vela";
      items[total++]="Minima da vela";
      items[total++]="Fechamento do dia";
      items[total++]="Abertura do dia";
      items[total++]="Maxima do dia";
      items[total++]="Minima do dia";
      items[total++]="Tamanho da vela";
      items[total++]="Corpo da vela";
      items[total++]="Empty Value";

      for(int slot=0;slot<4;slot++)
        {
         const int idx=m_slots[slot].SelectedIndicatorIndex();
         const string prefix=(string)(slot+1)+" ";

         if(idx==1)
           {
            items[total++]=prefix+"keltner Central";
            items[total++]=prefix+"keltner superior";
            items[total++]=prefix+"keltner inferior";
           }
         else if(idx==2)
           {
            items[total++]=prefix+"dochian superior";
            items[total++]=prefix+"dochian central";
            items[total++]=prefix+"dochian inferior";
           }
         else if(idx==3)
           {
            items[total++]=prefix+"regressao Ratio";
           }
         else if(idx==4)
           {
            items[total++]=prefix+"afastamento medio";
           }
         else if(idx==5)
           {
            items[total++]=prefix+"desvio afastamento";
            items[total++]=prefix+"desvio medio";
           }
         else if(idx==6)
           {
            items[total++]=prefix+"atr superior";
            items[total++]=prefix+"atr central";
            items[total++]=prefix+"atr inferior";
           }
         else if(idx==7)
           {
            items[total++]=prefix+"media movel";
           }
         else if(idx==8)
           {
            items[total++]=prefix+"bandas superior";
            items[total++]=prefix+"bandas central";
            items[total++]=prefix+"bandas inferior";
           }
         else if(idx==9)
           {
            items[total++]=prefix+"envelope superior";
            items[total++]=prefix+"envelope inferior";
           }
         else if(idx==10)
           {
            items[total++]=prefix+"estocastico principal";
            items[total++]=prefix+"estocastico sinal";
           }
         else if(idx==11)
           {
            items[total++]=prefix+"rsi";
           }
         else if(idx==12)
           {
            items[total++]=prefix+"desvio padrao";
           }
         else if(idx==13)
           {
            items[total++]=prefix+"volume";
           }
         else if(idx==14)
           {
            items[total++]=prefix+"atr";
           }
         else if(idx==15)
           {
            items[total++]=prefix+"parabolic sar";
           }
         else if(idx==16)
           {
            items[total++]=prefix+"fractal superior";
            items[total++]=prefix+"fractal inferior";
           }
         else if(idx==17)
           {
            items[total++]=prefix+"obv";
           }
         else if(idx==18)
           {
            items[total++]=prefix+"macd histograma";
            items[total++]=prefix+"mack sinal";
           }
         else if(idx==19)
           {
            items[total++]=prefix+"acumulacao/distribuicao (a/d)";
           }
         else if(idx==20)
           {
            items[total++]=prefix+"mfi (money flow index)";
           }
         else if(idx==21)
           {
            items[total++]=prefix+"vidya - valor";
           }
         else if(idx==22)
           {
            items[total++]=prefix+"tema - valor";
           }
         else if(idx==23)
           {
            items[total++]=prefix+"frama-valor";
           }
         else if(idx==24)
           {
            items[total++]=prefix+"trix valor";
           }
         else if(idx==25)
           {
            items[total++]=prefix+"bears power valor";
           }
        }

      ArrayResize(items,total);
     }

   void RefreshLogicValueCombos(void)
     {
      string items[];
      BuildLogicValueItems(items);

      for(int row=0;row<5;row++)
        {
         const int selected_idx=m_logic_value_combo[row].GetListViewPointer().SelectedItemIndex();
         const int compare_selected_idx=m_logic_compare_value_combo[row].GetListViewPointer().SelectedItemIndex();

         m_logic_value_combo[row].ItemsTotal(ArraySize(items));
         m_logic_compare_value_combo[row].ItemsTotal(ArraySize(items));

         for(int item_idx=0;item_idx<ArraySize(items);item_idx++)
           {
            m_logic_value_combo[row].SetValue(item_idx,items[item_idx]);
            m_logic_compare_value_combo[row].SetValue(item_idx,items[item_idx]);
           }

         const int next_selected=(selected_idx>=0 && selected_idx<ArraySize(items) ? selected_idx : 0);
         const int next_compare_selected=(compare_selected_idx>=0 && compare_selected_idx<ArraySize(items) ? compare_selected_idx : 0);

         m_logic_value_combo[row].SelectItem(next_selected);
         m_logic_compare_value_combo[row].SelectItem(next_compare_selected);
         m_logic_value_combo[row].Update(true);
         m_logic_value_combo[row].GetButtonPointer().Update(true);
         m_logic_value_combo[row].GetListViewPointer().Update(true);
         m_logic_compare_value_combo[row].Update(true);
         m_logic_compare_value_combo[row].GetButtonPointer().Update(true);
         m_logic_compare_value_combo[row].GetListViewPointer().Update(true);
        }
     }

public:
                        CTab8MontarMainView(void) : m_host(NULL), m_created(false), m_is_active(false), m_window_index(-1), m_tab_index(-1)
                          {
                           for(int i=0;i<4;i++)
                              m_logic_slot_last[i]=-1;
                          }

   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int tabs_w=tabs.XSize();
      const int tabs_h=tabs.YSize();
      const int content_pad=18;
      const int content_y=26;
      const int content_w=tabs_w-(content_pad*2);
      const int gap=10;
      const int slot_w=(content_w-(gap*3))/4;
      const int available_h=tabs_h-content_y-14;
      const int slot_h=(available_h-12)/2;
      const int logic_y=content_y+slot_h+gap;
      const int logic_h=available_h-slot_h-gap;

      for(int slot=0;slot<4;slot++)
        {
         const int slot_x=content_pad+(slot_w+gap)*slot;
         if(!m_slots[slot].Create(*m_host,m_window_index,tabs,m_tab_index,slot,slot_x,content_y,slot_w,slot_h))
            return(false);
        }

      if(!V2CreateCard(*m_host,m_logic_card,tabs,m_window_index,m_tab_index,content_pad,logic_y,content_w,logic_h,V2_COLOR_CARD_BACK,V2_COLOR_CARD_BORDER))
         return(false);
      if(!V2CreateCardTitle(*m_host,m_logic_title,"Composicao logica dos sinais",m_logic_card,tabs,m_window_index,m_tab_index,16,12,content_w-32))
         return(false);
      if(!m_host.CreateTextLabel(m_logic_note,"Conectores logicos migrados do V1 para montar as comparacoes entre os 4 slots acima.",m_logic_card,m_window_index,tabs,m_tab_index,16,40,content_w-32,20))
         return(false);
      m_logic_note.FontSize(10);
      m_logic_note.LabelColor(V2_COLOR_TEXT_SECONDARY);

      string col_titles[];
      ArrayResize(col_titles,6);
      col_titles[0]="Operador";
      col_titles[1]="Valor ref.";
      col_titles[2]="Velas";
      col_titles[3]="Comparacao";
      col_titles[4]="Valor comp.";
      col_titles[5]="Velas comp.";

      string logic_items[];
      ArrayResize(logic_items,7);
      logic_items[0]="SE";
      logic_items[1]="E";
      logic_items[2]="OU";
      logic_items[3]="E SE";
      logic_items[4]="OU SE";
      logic_items[5]="E Tambem";
      logic_items[6]="OU Tambem";

      string candle_items[];
      ArrayResize(candle_items,4);
      candle_items[0]="Vela atual";
      candle_items[1]="Vela anterior";
      candle_items[2]="Penultima vela";
      candle_items[3]="Anti Penultima";

      string compare_items[];
      ArrayResize(compare_items,10);
      compare_items[0]="Maior que";
      compare_items[1]="Menor que";
      compare_items[2]="Maior ou igual que";
      compare_items[3]="Menor ou igual que";
      compare_items[4]="Igual que";
      compare_items[5]="Diferente de";
      compare_items[6]="Cruzar p/ cima de";
      compare_items[7]="Cruzar p/ baixo de";
      compare_items[8]="Cruzar&fechar acima de";
      compare_items[9]="Cruzar&fechar abaixo de";

      string value_items[];
      BuildLogicValueItems(value_items);

      const int table_x=16;
      const int table_y=78;
      const int table_w=content_w-32;
      const int col_gap=6;
      const int logic_w=84;
      const int candle_w=92;
      const int compare_w=126;
      const int value_w=(table_w-logic_w-(2*candle_w)-compare_w-(5*col_gap))/2;
      int col_x[6];
      int col_w[6];
      col_x[0]=table_x;
      col_x[1]=table_x+logic_w+col_gap;
      col_x[2]=col_x[1]+value_w+col_gap;
      col_x[3]=col_x[2]+candle_w+col_gap;
      col_x[4]=col_x[3]+compare_w+col_gap;
      col_x[5]=col_x[4]+value_w+col_gap;
      col_w[0]=logic_w;
      col_w[1]=value_w;
      col_w[2]=candle_w;
      col_w[3]=compare_w;
      col_w[4]=value_w;
      col_w[5]=candle_w;

      for(int i=0;i<6;i++)
        {
         if(!V2CreateFieldLabel(*m_host,m_logic_cols[i],col_titles[i],m_logic_card,tabs,m_window_index,m_tab_index,col_x[i],table_y,col_w[i],16))
            return(false);
        }

      int row_y=table_y+22;
      for(int i=0;i<5;i++)
        {
         if(!CreateComboControl(m_logic_operator_combo[i],m_logic_card,tabs,col_x[0],row_y,col_w[0],120,logic_items,0,V2_COLOR_CARD_BORDER))
            return(false);
         if(!CreateComboControl(m_logic_value_combo[i],m_logic_card,tabs,col_x[1],row_y,col_w[1],220,value_items,0,V2_COLOR_CARD_BORDER))
            return(false);
         if(!CreateComboControl(m_logic_candle_combo[i],m_logic_card,tabs,col_x[2],row_y,col_w[2],120,candle_items,0,V2_COLOR_CARD_BORDER))
            return(false);
         if(!CreateComboControl(m_logic_compare_combo[i],m_logic_card,tabs,col_x[3],row_y,col_w[3],180,compare_items,0,V2_COLOR_CARD_BORDER))
            return(false);
         if(!CreateComboControl(m_logic_compare_value_combo[i],m_logic_card,tabs,col_x[4],row_y,col_w[4],220,value_items,0,V2_COLOR_CARD_BORDER))
            return(false);
         if(!CreateComboControl(m_logic_compare_candle_combo[i],m_logic_card,tabs,col_x[5],row_y,col_w[5],120,candle_items,0,V2_COLOR_CARD_BORDER))
            return(false);
         row_y+=34;
        }

      m_created=true;
      SetActive(false);
      return(true);
     }

   void OnTimerEvent(void)
     {
      if(!m_created || !m_is_active)
         return;

      for(int i=0;i<4;i++)
         m_slots[i].OnTimerEvent();

      bool changed=false;
      for(int i=0;i<4;i++)
        {
         const int selected=m_slots[i].SelectedIndicatorIndex();
         if(selected!=m_logic_slot_last[i])
           {
            m_logic_slot_last[i]=selected;
            changed=true;
           }
        }

      if(changed)
         RefreshLogicValueCombos();
     }

   void RefreshSlots(void)
     {
      if(!m_created || !m_is_active)
         return;

      for(int i=0;i<4;i++)
         m_slots[i].RefreshView();

      for(int i=0;i<4;i++)
         m_logic_slot_last[i]=m_slots[i].SelectedIndicatorIndex();
      RefreshLogicValueCombos();
     }

   void SetActive(const bool active)
     {
      if(!m_created)
         return;

      m_is_active=active;
      for(int i=0;i<4;i++)
         m_slots[i].SetActive(active);

      SetFrameVisible(m_logic_card,active);
      SetLabelVisible(m_logic_title,active);
      SetLabelVisible(m_logic_note,active);
      for(int i=0;i<6;i++)
         SetLabelVisible(m_logic_cols[i],active);
      for(int i=0;i<5;i++)
        {
         SetComboVisible(m_logic_operator_combo[i],active);
         SetComboVisible(m_logic_value_combo[i],active);
         SetComboVisible(m_logic_candle_combo[i],active);
         SetComboVisible(m_logic_compare_combo[i],active);
         SetComboVisible(m_logic_compare_value_combo[i],active);
         SetComboVisible(m_logic_compare_candle_combo[i],active);
        }

      if(active)
         RefreshSlots();
     }
  };

#endif // __CONSTRUTOR_V2_TAB8_MONTAR_MAIN_VIEW_MQH__
