//
//  ViewController.m
//  TextKitDemo
//
//  Created by wwwins on 2015/10/19.
//  Copyright © 2015年 wwwins. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+UITextViewAdditions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

  [self setAttributes:self.textView];
}

// Start from the top
- (void)viewDidLayoutSubviews {
  [self.textView setContentOffset:CGPointZero animated:NO];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)setAttributes:(UITextView*)textView
{
  NSMutableDictionary *titleAttributes = [@{NSFontAttributeName:[UIFont systemFontOfSize:18.0]} mutableCopy];
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"標題\n\n" attributes:titleAttributes];

  NSString *showString = nil;
  NSDictionary *attributes = nil;
  //字距调整（Kerning）
  [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"字距調整（Kerning）\n" attributes:titleAttributes]];
  attributes = @{NSKernAttributeName:@5};
  [attributedString appendAttributedString:
   [[NSAttributedString alloc] initWithString:@"字體間距測試一二三四ABCDEF\n\n" attributes:attributes]];
  //連字(Ligatures)属性，一般中文用不到，在英文中可能出现相鄰近字母相連的情况。0:不相連，1: 相連，也是預設值，2 在 ios 上不支援
  [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"連字(Ligatures)\n" attributes:titleAttributes]];
  attributes = @{NSLigatureAttributeName:@1, NSFontAttributeName:[UIFont fontWithName: @"futura" size: 30]};
  [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"flush中文沒差\n" attributes:attributes]];
  attributes = @{NSLigatureAttributeName:@0, NSFontAttributeName:[UIFont fontWithName: @"futura" size: 30]};
  [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"flush中文沒差\n" attributes:attributes]];

  //段落排版
  [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n段落排版\n" attributes:titleAttributes]];
  NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
  paragraphStyle.alignment = NSTextAlignmentJustified;
  paragraphStyle.firstLineHeadIndent = 20.0;
  paragraphStyle.headIndent = 2.0;
//  paragraphStyle.tailIndent = 2.0;
  paragraphStyle.lineSpacing = 5.0;
  showString = [NSString stringWithFormat:@"這段文字左右對齊！首行缩排firstLineHeadIndent=%f；缩排headIndent=%f；尾部缩排tailIndent=%f；行距lineSpacing=%f；", paragraphStyle.firstLineHeadIndent, paragraphStyle.headIndent, paragraphStyle.tailIndent, paragraphStyle.lineSpacing];
  attributes = @{NSParagraphStyleAttributeName:paragraphStyle};
  [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:showString attributes:attributes]];

  //insert dynamic image
  [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n附件遠端圖片\n\n" attributes:titleAttributes]];
  NSTextAttachment *dynamicattachment = [[NSTextAttachment alloc] init];
  NSURL *url = [NSURL URLWithString:@"https://devimages.apple.com.edgekey.net/ios/images/multitasking-slide-over.jpg"];
  NSData *data = [NSData dataWithContentsOfURL:url];
  UIImage *dynamicimage = [UIImage imageWithData:data];
  dynamicattachment.image = dynamicimage;
  dynamicattachment.bounds = CGRectMake(0, 0, 720*0.5, 519*0.5);
  attributes = @{NSAttachmentAttributeName:dynamicattachment};
  [attributedString appendAttributedString:[NSAttributedString attributedStringWithAttachment:dynamicattachment]];

  textView.attributedText = attributedString;

  [self.textView addLineSpace];
  
  //insert static image
  [self.textView addBody:@"附件本機圖片\n\n"];
  [self.textView addImage:[UIImage imageNamed:@"Toolbox-180"]];
  [self.textView addLineSpace];

  //大標題
  [self.textView addTitle:@"這是大標題+底色\n" backgroundColor:[UIColor lightGrayColor]];
  [self.textView addSubTitle:@"時間:2015/10/19\n地點:民生東路三段138號\n" backgroundColor:[UIColor lightGrayColor]];

  //超長段洛
  [self.textView addBody:@"我樂觀的接受無常消失在離去的地平線，已經決心自己過沒有你，過得快樂或委屈也許在來生的某個明天，好怕有誰會出現獨處的時候，看得比羽毛還輕薄，ya~~~給我一個讚oh，就深藏在心我好想你，知我慢慢走，cha你在歐洲，全都一個樣關了燈，改變既有的模式！我想他聽你欣欣的回報這番作客只嘗甜漿，因為前途還是不減啟程時的渺茫，那邊每株樹上都是滿掛著詩情最秀逸的果實，那才是你實際領受，這時候想回頭已經太遲，誰沒有悵惘？我聞到妳身上的香味，鴨肉便輕而易舉地撕下…慢慢嚼，中午連瞇一會的地方都沒有，有些餓了翻身下床，翹起二郎腿在陽台上看書聽鳥鳴，喜怒哀乐，買了個越南壺，这么高大上的东东，喜歡一個品牌應該是因為它背後的故事和設計，灌了果汁和咖啡，問別人喜歡喝什麼咖啡是很有用的。熱身賽挨轟，婦竟餵幼子安眠藥，6旬病翁撞火車亡，一人分飾男女二角，XPERIA，投縣風景區塞爆，國內油價連3漲，火場濃煙密布，爭取台灣十大觀光小城，桃機多班航班延遲及轉降，雞牛夾攻馬政府，1DX，水手官網專訪，歐巴馬Google+，蘇貞昌掌舵呼聲高，搶救急性心肌梗塞分秒必爭。台紐政府基金，全國政協十一屆五次會議開幕，古坑華山辦首超馬，One，賞櫻瘋，沒有蓋世三，III與Nikon，奧斯卡頒獎典禮，7年級生罹骨質疏鬆，五月天、蔡依林台中開唱獻愛心，扁戒護就醫，誰是新黨魁？請允許我，在我消失在這個世界之前，你是世界上最幸福的人，請允許我，你是世界上最幸福的人，那麼餘下四分之三的時光請讓我來守護你好嗎？\n"];

}
@end
