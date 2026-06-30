#ifndef __CONSTRUTOR_V2_SHARED_MQH__
#define __CONSTRUTOR_V2_SHARED_MQH__

#include "..\\CEFGuiAliases.mqh"

const color V2_COLOR_WINDOW_BACK=C'245,247,250';
const color V2_COLOR_SURFACE=C'255,255,255';
const color V2_COLOR_CARD_BACK=C'255,255,255';
const color V2_COLOR_CARD_BORDER=C'214,220,229';
const color V2_COLOR_FIELD_BORDER=C'198,206,217';
const color V2_COLOR_TEXT_PRIMARY=C'33,37,41';
const color V2_COLOR_TEXT_SECONDARY=C'108,117,125';
const color V2_COLOR_TAB_BACK=C'248,249,251';
const color V2_COLOR_TAB_BACK_HOVER=C'240,243,247';
const color V2_COLOR_TAB_ACTIVE=C'255,255,255';
const color V2_COLOR_TAB_BORDER=C'214,220,229';
const color V2_COLOR_ACCENT=C'73,118,189';
const color V2_COLOR_SIDEBAR_BACK=C'35,41,52';
const color V2_COLOR_SIDEBAR_BACK_HOVER=C'45,52,64';
const color V2_COLOR_SIDEBAR_ACTIVE=C'58,110,165';
const color V2_COLOR_SIDEBAR_BORDER=C'68,76,89';
const color V2_COLOR_SIDEBAR_TEXT=C'222,226,230';

int V2ClampIndex(const int value,const int min_value,const int max_value)
  {
   if(value<min_value)
      return(min_value);
   if(value>max_value)
      return(max_value);
   return(value);
  }

bool V2TryParseHourMin(const string value,int &hour,int &minute)
  {
   if(StringLen(value)<5)
      return(false);
   const int sep=StringFind(value,":");
   if(sep<0)
      return(false);

   hour=(int)StringToInteger(StringSubstr(value,0,sep));
   minute=(int)StringToInteger(StringSubstr(value,sep+1));
   return(true);
  }

void V2ItemsSimNao(string &items[])
  {
   ArrayResize(items,2);
   items[0]="Nao";
   items[1]="Sim";
  }

void V2ItemsMercado(string &items[])
  {
   ArrayResize(items,2);
   items[0]="B3";
   items[1]="Forex";
  }

void V2ItemsTipoOperacional(string &items[])
  {
   ArrayResize(items,2);
   items[0]="Day trade";
   items[1]="Swing trade";
  }

void V2ItemsModoProcessamento(string &items[])
  {
   ArrayResize(items,2);
   items[0]="Cada tick";
   items[1]="Cada segundo";
  }

void V2ItemsTempoGrafico(string &items[])
  {
   ArrayResize(items,21);
   items[0]="Corrente";
   items[1]="M1";
   items[2]="M2";
   items[3]="M3";
   items[4]="M4";
   items[5]="M5";
   items[6]="M6";
   items[7]="M10";
   items[8]="M12";
   items[9]="M15";
   items[10]="M30";
   items[11]="H1";
   items[12]="H2";
   items[13]="H3";
   items[14]="H4";
   items[15]="H6";
   items[16]="H8";
   items[17]="H12";
   items[18]="D1";
   items[19]="W1";
   items[20]="MN1";
  }

void V2ItemsHoras(string &items[])
  {
   ArrayResize(items,24);
   for(int i=0;i<24;i++)
      items[i]=StringFormat("%02d",i);
  }

void V2ItemsMinutos(string &items[])
  {
   ArrayResize(items,60);
   for(int i=0;i<60;i++)
      items[i]=StringFormat("%02d",i);
  }

void V2ItemsStopTipo(string &items[])
  {
   ArrayResize(items,2);
   items[0]="Pontos";
   items[1]="Percentual";
  }

void V2ItemsBaseMedia(string &items[])
  {
   ArrayResize(items,4);
   items[0]="Maxima";
   items[1]="Minima";
   items[2]="Abertura";
   items[3]="Fechamento";
  }

void V2ItemsBaseMultiplicador(string &items[])
  {
   ArrayResize(items,2);
   items[0]="Corpo do candle";
   items[1]="Range (pavio a pavio)";
  }

void V2ItemsPosicaoReferencia(string &items[])
  {
   ArrayResize(items,4);
   items[0]="Atual";
   items[1]="Ultimo";
   items[2]="Penultimo";
   items[3]="Antepenultimo";
  }

void V2ItemsExpirar(string &items[])
  {
   ArrayResize(items,5);
   items[0]="Nao expirar";
   items[1]="1 candle";
   items[2]="2 candles";
   items[3]="3 candles";
   items[4]="4 candles";
  }

string V2SignalDirectionMessage(const bool is_buy)
  {
   if(is_buy)
      return("Voce esta criando um sinal de compra, o de venda sera gerado automaticamente.");
   return("Voce esta criando um sinal de venda, o de compra sera gerado automaticamente.");
  }

void V2StyleCombo(CEF_CComboBox &combo,const color border,const int width,const int list_height,const int button_width)
  {
   combo.XSize(width);
   combo.YSize(20);
   combo.BackColor(V2_COLOR_SURFACE);
   combo.BackColorHover(V2_COLOR_SURFACE);
   combo.BackColorPressed(V2_COLOR_SURFACE);
   combo.BorderColor(border);
   combo.BorderColorHover(border);
   combo.BorderColorPressed(border);
   combo.FontSize(10);
   combo.CheckBoxMode(false);
   combo.GetButtonPointer().XSize(button_width);
   combo.GetButtonPointer().XGap(1);
   combo.GetButtonPointer().YSize(20);
   combo.GetButtonPointer().AnchorRightWindowSide(false);
   combo.GetButtonPointer().BackColor(V2_COLOR_SURFACE);
   combo.GetButtonPointer().BackColorHover(V2_COLOR_SURFACE);
   combo.GetButtonPointer().BackColorPressed(V2_COLOR_SURFACE);
   combo.GetButtonPointer().BorderColor(border);
   combo.GetButtonPointer().BorderColorHover(border);
   combo.GetButtonPointer().BorderColorPressed(border);
   combo.GetButtonPointer().IconXGap(button_width-18);
   combo.GetButtonPointer().LabelXGap(10);
   combo.GetButtonPointer().LabelColor(V2_COLOR_TEXT_PRIMARY);
   combo.GetListViewPointer().YSize(list_height);
   combo.GetListViewPointer().LightsHover(true);
   combo.GetListViewPointer().BackColor(V2_COLOR_SURFACE);
  }

void V2StyleSpin(CEF_CTextEdit &spin,const color back,const color border,const int width,const double max_value,const double min_value,const double step,const int digits,const string value)
  {
   spin.XSize(width);
   spin.MaxValue(max_value);
   spin.MinValue(min_value);
   spin.StepValue(step);
   spin.SetDigits(digits);
   spin.SpinEditMode(true);
   spin.CheckBoxMode(false);
   spin.SetValue(value);
   spin.GetTextBoxPointer().XSize(width-34);
   spin.GetTextBoxPointer().AutoSelectionMode(true);
   spin.GetTextBoxPointer().AnchorRightWindowSide(false);
   spin.GetTextBoxPointer().XGap(1);
   spin.BackColor(back);
   spin.BackColorHover(back);
   spin.BackColorPressed(back);
   spin.BorderColor(border);
   spin.BorderColorHover(border);
   spin.BorderColorPressed(border);
   spin.GetTextBoxPointer().BackColor(V2_COLOR_SURFACE);
   spin.GetTextBoxPointer().BackColorHover(V2_COLOR_SURFACE);
   spin.GetTextBoxPointer().BackColorPressed(V2_COLOR_SURFACE);
   spin.GetTextBoxPointer().BorderColor(border);
   spin.GetTextBoxPointer().BorderColorHover(border);
   spin.GetTextBoxPointer().BorderColorPressed(border);
   spin.GetIncButtonPointer().BackColor(V2_COLOR_SURFACE);
   spin.GetIncButtonPointer().BackColorHover(V2_COLOR_SURFACE);
   spin.GetIncButtonPointer().BackColorPressed(V2_COLOR_SURFACE);
   spin.GetIncButtonPointer().BorderColor(border);
   spin.GetIncButtonPointer().BorderColorHover(border);
   spin.GetIncButtonPointer().BorderColorPressed(border);
   spin.GetDecButtonPointer().BackColor(V2_COLOR_SURFACE);
   spin.GetDecButtonPointer().BackColorHover(V2_COLOR_SURFACE);
   spin.GetDecButtonPointer().BackColorPressed(V2_COLOR_SURFACE);
   spin.GetDecButtonPointer().BorderColor(border);
   spin.GetDecButtonPointer().BorderColorHover(border);
   spin.GetDecButtonPointer().BorderColorPressed(border);
  }

void V2StyleTextEdit(CEF_CTextEdit &edit,const color border,const int width)
  {
   edit.XSize(width);
   edit.YSize(20);
   edit.CheckBoxMode(false);
   edit.SpinEditMode(false);
   edit.BackColor(V2_COLOR_SURFACE);
   edit.BackColorHover(V2_COLOR_SURFACE);
   edit.BackColorPressed(V2_COLOR_SURFACE);
   edit.BorderColor(border);
   edit.BorderColorHover(border);
   edit.BorderColorPressed(border);
   edit.GetTextBoxPointer().BackColor(V2_COLOR_SURFACE);
   edit.GetTextBoxPointer().BackColorHover(V2_COLOR_SURFACE);
   edit.GetTextBoxPointer().BackColorPressed(V2_COLOR_SURFACE);
   edit.GetTextBoxPointer().BorderColor(border);
   edit.GetTextBoxPointer().BorderColorHover(border);
   edit.GetTextBoxPointer().BorderColorPressed(border);
  }

bool V2CreateCard(CEF_CWndCreate &wnd,CEF_CFrame &frame,CEF_CTabs &tabs,const int window_index,const int tab_index,const int x,const int y,const int w,const int h,const color back,const color border)
  {
   if(!wnd.CreateFrame(frame,"",tabs,window_index,tabs,tab_index,x,y,w,h,1))
      return(false);
   frame.BackColor(back);
   frame.BorderColor(border);
   return(true);
  }

bool V2CreateCardTitle(CEF_CWndCreate &wnd,CEF_CTextLabel &label,const string text,CElement &owner,CEF_CTabs &tabs,const int window_index,const int tab_index,const int x,const int y,const int w)
  {
   if(!wnd.CreateTextLabel(label,text,owner,window_index,tabs,tab_index,x,y,w,22))
      return(false);
   label.FontSize(12);
   label.LabelColor(V2_COLOR_TEXT_PRIMARY);
   return(true);
  }

bool V2CreateFieldLabel(CEF_CWndCreate &wnd,CEF_CTextLabel &label,const string text,CElement &owner,CEF_CTabs &tabs,const int window_index,const int tab_index,const int x,const int y,const int w,const int h=18)
  {
   if(!wnd.CreateTextLabel(label,text,owner,window_index,tabs,tab_index,x,y,w,h))
      return(false);
   label.FontSize(10);
   label.LabelColor(V2_COLOR_TEXT_SECONDARY);
   return(true);
  }

class CV2BusyProgress
  {
private:
   CEF_CProgressBar m_bar;
   bool             m_created;

public:
                     CV2BusyProgress(void) : m_created(false) {}

   bool Create(CEF_CWndCreate &wnd,CElement &owner,const int window_index,const int x,const int y,const int width,const string text="Organizando interface")
     {
      if(m_created)
         return(true);

      m_bar.XSize(width);
      m_bar.YSize(18);
      m_bar.BarYSize(12);
      m_bar.BarBorderWidth(1);
      m_bar.BarYGap(4);
      m_bar.LabelXGap(0);
      m_bar.LabelYGap(0);
      m_bar.PercentXGap(6);
      m_bar.PercentYGap(0);
      m_bar.FontSize(9);
      m_bar.LabelColor(V2_COLOR_TEXT_SECONDARY);
      m_bar.BorderColor(V2_COLOR_CARD_BORDER);
      m_bar.IndicatorBackColor(V2_COLOR_SURFACE);
      m_bar.IndicatorColor(V2_COLOR_ACCENT);
      if(!wnd.CreateProgressBar(m_bar,text,owner,window_index,x,y))
         return(false);

      m_bar.Hide();
      m_created=true;
      return(true);
     }

   void Begin(const string text,const int total=3)
     {
      if(!m_created)
         return;
      m_bar.LabelText(text);
      m_bar.Show();
      m_bar.Update(0,total);
      ChartRedraw();
     }

   void Step(const int index,const int total=3)
     {
      if(!m_created)
         return;
      m_bar.Update(index,total);
      ChartRedraw();
     }

   void Finish(void)
     {
      if(!m_created)
         return;
      m_bar.Hide();
      ChartRedraw();
     }
  };

#endif // __CONSTRUTOR_V2_SHARED_MQH__
