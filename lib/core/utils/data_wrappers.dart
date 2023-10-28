import 'package:dartz/dartz.dart';
import 'package:dog_app/core/exceptions/failures.dart';
import 'package:dog_app/core/network/network_info.dart';
import 'package:flutter/material.dart';

class DataWrappers<T> {
  Future<Either<Failure, T>> tryCatchWrapper(
    NetworkInfo network,
    Future<T> Function() remoteFunction, {
    Future<T> Function()? cacheFunction,
  }) async {
    if (await network.isConnected) {
      try {
        final remote = await remoteFunction();
        return Right(remote);
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        return Left(ServerFailure());
      }
    } else {
      if (cacheFunction != null) {
        try {
          final cache = await cacheFunction();
          return Right(cache);
        } catch (e, s) {
          debugPrint(e.toString());
          debugPrint(s.toString());
          return Left(CacheFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    }
  }

  Future<Either<Failure, T>> localFirstTryCatchWrapper(
    NetworkInfo network,
    Future<T> Function() remoteFunction, {
    Future<T> Function()? cacheFunction,
  }) async {
    if (cacheFunction != null) {
      try {
        final cache = await cacheFunction();
        return Right(cache);
      } catch (e) {
        debugPrint(e.toString());
        if (await network.isConnected) {
          try {
            final remote = await remoteFunction();
            return Right(remote);
          } catch (e, s) {
            debugPrint(e.toString());
            debugPrint(s.toString());
            return Left(ServerFailure());
          }
        } else {
          return Left(CacheFailure());
        }
      }
    } else {
      if (await network.isConnected) {
        try {
          final remote = await remoteFunction();
          return Right(remote);
        } catch (e, s) {
          debugPrint(e.toString());
          debugPrint(s.toString());
          return Left(ServerFailure());
        }
      } else {
        return Left(CacheFailure());
      }
    }
  }
}
