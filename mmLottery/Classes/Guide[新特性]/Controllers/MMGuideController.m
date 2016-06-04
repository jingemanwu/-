//
//  MMGuideController.m
//  mmLottery
//
//  Created by Apple on 16/5/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMGuideController.h"
#import "MMGuideCell.h"

@interface MMGuideController ()

/**
 *  存放所有背景图片的数组
 */
@property (nonatomic, strong) NSArray<UIImage *> *imagesArr;

/**
 *  篮球,足球
 */
@property (nonatomic, weak) UIImageView *ballView;
/**
 *  大文字
 */
@property (nonatomic, weak) UIImageView *largeTextView;
/**
 *  小文字
 */
@property (nonatomic, weak) UIImageView *smallTextView;


@end

@implementation MMGuideController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - 重写init方法,指定布局
- (instancetype)init {

    // MARK: - 1.创建流水布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // 1.2 设置cell的大小
    // self.collectionView还没有值,nil
//    flowLayout.itemSize = self.collectionView.bounds.size;
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    // 1.3 水平方向滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 1.4 调整item间距
    flowLayout.minimumLineSpacing = 0;
    
    
    return [super initWithCollectionViewLayout:flowLayout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - 1.设置基本属性
    self.collectionView.backgroundColor = MMRandomColor;
    
    // 1.关闭弹簧效果
    self.collectionView.bounces = NO;
    
    // 2.设置分页效果
    self.collectionView.pagingEnabled = YES;
    
    // 3.关闭底部的滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[MMGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // MARK: - 2.添加波浪线及其他3个小图
    [self setupUI];
}

#pragma mark - 添加图片框的操作!
- (void)setupUI {
    
    // 波浪线
    UIImageView *blxView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    
    blxView.x = -200;
    [self.collectionView addSubview:blxView];
    
    // 篮球足球
    UIImageView *ballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:ballView];
    
    // 大文字
    UIImageView *largeTextView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];

    largeTextView.y = self.collectionView.height * 0.7;
    
    [self.collectionView addSubview:largeTextView];
    
    // 小文字
    UIImageView *smallTextView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    
    smallTextView.y = self.collectionView.height * 0.8;
    
    [self.collectionView addSubview:smallTextView];
    
    
    // 赋值
    _ballView = ballView;
    _largeTextView = largeTextView;
    _smallTextView = smallTextView;
    
    
}

#pragma mark - 代理方法
// 当用户抬起手指,scrollView开始变慢[减速],减速完成[静止]的时候调用一次!
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    MMLog(@"减速完成");
    // 1.获取在屏幕x轴方向的偏移量
    CGFloat offsetX = scrollView.contentOffset.x;

    // 1.2 判断方向
    if (self.ballView.x > offsetX) {
        MMLog(@"向右扫动");
        self.ballView.x = offsetX - scrollView.width;
        
    } else {
        
        MMLog(@"向左扫动");
        self.ballView.x = offsetX + scrollView.width;
    }
    
    // 2.切换图片
    // 2.0 计算索引
    CGFloat idx = offsetX / scrollView.width;
    
    // 2.1 拼接图片名称
    NSString *ballName = [NSString stringWithFormat:@"guide%@", @(idx + 1)];
    NSString *largeTextName = [NSString stringWithFormat:@"guideLargeText%@", @(idx + 1)];
    NSString *smallTextName = [NSString stringWithFormat:@"guideSmallText%@", @(idx + 1)];
    
    // 2.2 改图片
    self.ballView.image = [UIImage imageNamed:ballName];
    self.largeTextView.image = [UIImage imageNamed:largeTextName];
    self.smallTextView.image = [UIImage imageNamed:smallTextName];
    
    
    
    // 3.修改3个图片框,保证能够看到!
    [UIView animateWithDuration:0.5 animations:^{
        
        self.ballView.x = offsetX;
        self.largeTextView.x = offsetX;
        self.smallTextView.x = offsetX;
    }];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.imagesArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MMGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 设置背景图片
    cell.backgroundView = [[UIImageView alloc] initWithImage:self.imagesArr[indexPath.item]];
    
    // 最后一个cell现实按钮,其他的隐藏!
    if (indexPath.item == self.imagesArr.count - 1) {
        cell.experienceBtn.hidden = NO;
    } else {
        
        cell.experienceBtn.hidden = YES;
    }
    
    return cell;
}


#pragma mark - 懒加载
- (NSArray<UIImage *> *)imagesArr {

    if (_imagesArr == nil) {
        _imagesArr = @[
                       [UIImage imageNamed:@"guide1Background"],
                       [UIImage imageNamed:@"guide2Background"],
                       [UIImage imageNamed:@"guide3Background"],
                       [UIImage imageNamed:@"guide4Background"],
//                       @"123123"
                       ];
    }
    return _imagesArr;

}

- (void)dealloc {

    MMLog(@"新特性---> over");
}


@end
