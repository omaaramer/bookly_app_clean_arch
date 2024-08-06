import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({required this.remoteDataSource, required this.localDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNum = 0}) async {
    List<BookEntity> books;
    try {
      books = localDataSource.featchFeaturedBooks(
        pageNum: pageNum,
      );
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await remoteDataSource.featchFeaturedBooks(pageNum: pageNum);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = localDataSource.featchNewsetBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await remoteDataSource.featchNewsetBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
