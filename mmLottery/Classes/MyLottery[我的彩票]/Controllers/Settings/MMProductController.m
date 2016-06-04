//
//  MMProductController.m
//  mmLottery
//
//  Created by Apple on 16/5/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMProductController.h"
#import "MMProduct.h"
#import "MMProductCell.h"

@interface MMProductController ()

/**
 *  泛型的写法,告诉系统,这个数组里面存的都是MMProduct模型
 *  将来可以用点语法,设置值
 */
@property (nonatomic, strong) NSArray<MMProduct *> *productsArr;

@end

@implementation MMProductController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - 重写init方法,指定布局形式
- (instancetype)init {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置大小
    flowLayout.itemSize = CGSizeMake(80, 80);
    // 调整边距
    flowLayout.minimumInteritemSpacing = 0;

    // 设置内边距
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    

    return [super initWithCollectionViewLayout:flowLayout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning - 如果是通过xib创建,需要注册nib
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    // 设置背景
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MMProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 代理方法
// 选中某个cell的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.获取选中的数据
    // -1.获取选中的cell,再取模型
//    MMProductCell *selCell = [collectionView cellForItemAtIndexPath:indexPath];
//    
//    MMProduct *selProduct = selCell.productModel;
    
    // -2.直接取
    MMProduct *selProduct = self.productsArr[indexPath.item];
    
    // 2.打印信息
    MMLog(@"%@ --- > %@\n---> %@", selProduct.customUrl, selProduct.ID, selProduct.url);


}


#pragma mark - 数据源方法
// 1.有多少组?
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

// 2.有多少行?
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.productsArr.count;
}

// 3.每一行的内容?
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    // 1.创建cell
    MMProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 2.设置数据
//    cell.backgroundColor = [UIColor redColor];
    cell.productModel = self.productsArr[indexPath.item];
    
    
    // 3.返回cell
    return cell;

}








#pragma mark - 懒加载
- (NSArray<MMProduct *> *)productsArr {

    if (_productsArr == nil) {
        
        // 1.加载文件路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
        
        // 2.将文件数据转为NSData类型的二进制数据
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        // 3.序列化->将json数据转为oc中能够识别的字典和数组
        NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 4.字典转模型
        NSMutableArray *tempArr = [NSMutableArray array];
        
        [dictArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            MMProduct *product = [MMProduct productModelWithDict:obj];
            [tempArr addObject:product];
            
        }];
        
        
        // 5.拿去使用!
        // copy之后,保证其他人不能进行修改!
        _productsArr = tempArr.copy;
        
    }
    return _productsArr;
    
    
}

@end
